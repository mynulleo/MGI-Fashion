<template>
    <create-form @onSubmit="submit">
        <div class="col-lg-12">
            <Fieldset class="mb-3">
                <template v-slot:name>Page Section Information</template>
                <template v-slot:content>
                    <div class="row g-3">
                        <Select title="Page" field="data.page_id" col="4" :req="true" v-model="data.page_id"
                            label="title" :reduce="(obj) => obj.id" :options="pageId" placeholder="--Select One--"
                            :closeOnSelect="true" />
                        <Select title="Type" col="4" :req="true" field="data.type" v-model="data.type" label="name"
                            :reduce="(obj) => obj.value" :options="types" placeholder="--Select One--"
                            :closeOnSelect="true" />
                        <Input v-model="data.page_title" field="data.page_title" title="Page Title" :req="true"
                            col="4" />
                        <Input v-model="data.title" field="data.title" title="Title" :req="false" col="4" />
                        <Input v-model="data.sub_title" field="data.sub_title" title="Sub Title" :req="false" col="4" />
                        <Input v-if="data.type == 'url'" v-model="data.url" field="data.url" title="Url" :req="true"
                            col="4" />
                        <Input v-if="data.type == 'image'" v-model="data.amount" field="data.amount" title="Amount"
                            :req="false" col="4" />
                        <Input v-if="data.type == 'video'" v-model="data.video_url" field="data.video_url"
                            title="Video Url" :req="true" col="4" />

                        <!-- Image Section -->
                        <div class="col-12" v-if="data.type == 'image' || data.type == 'video'">
                            <div class="row g-3">
                                <File title="Section Image" field="data.original_image" mime="img" fileClassName="file2"
                                    :showCrop="true" :vHeight="$root.media_validators?.image?.min_height ?? 600"
                                    :vWidth="$root.media_validators?.image?.min_width ?? 600"
                                    :vSizeInKb="$root.media_validators?.image?.max_size ?? 5000" col="12 col-md-4"
                                    :req="true" />
                                <GlobalCrop field="data.original_image"
                                    v-on:update:modelValue="data.original_image = $event" :image="image.original_image"
                                    :minWidth="$root.media_validators?.image?.min_width ?? 600"
                                    :minHeight="$root.media_validators?.image?.min_height ?? 600">
                                </GlobalCrop>
                            </div>
                        </div>

                        <!-- Description Editor (Visible for text, image, and video types) -->
                        <div class="col-12" v-if="['text', 'image', 'video'].includes(data.type)">
                            <editor title="Description" v-model="data.description" :spinner="false"
                                field="data.description" :required="data.type == 'text'" col="12" />
                        </div>

                        <!-- Sorting & Status Row -->
                        <Input title="Sorting" field="data.sorting" v-model="data.sorting" :req="true" col="3"
                            type="number" />
                        <Switch v-model="data.status" field="data.status" title="Status" on-label="Active"
                            off-label="Deactive" :req="true" col="3">
                        </Switch>
                    </div>
                </template>
            </Fieldset>
        </div>
    </create-form>
</template>

<script>
import Editor from "../../../components/Form/CKEditor";
const model = "pageSection";

export default {
    components: { Editor },
    data() {
        return {
            page_title: "",
            model: model,
            data: { image: null, sorting: 0, status: "active", type: "text" },
            image: { original_image: "" },
            types: [
                { name: "Image", value: "image" },
                { name: "Video", value: "video" },
                { name: "Text", value: "text" },
                { name: "Button", value: "button" },
                { name: "Url", value: "url" },
            ],
            pageId: [],
        };
    },

    provide() {
        return {
            validate: this.validation,
            data: () => this.data,
            image: this.image,
        };
    },
    methods: {
        submit: function (e) {
            this.$validate().then((res) => {
                const error = this.validation.countErrors();
                if (error > 0) {
                    console.log(this.validation.allErrors());
                    this.$toast(
                        "You need to fill " +
                        error +
                        " more empty mandatory fields",
                        "warning"
                    );
                    return false;
                }
                if (res) {
                    var form = document.getElementById("form");
                    var formData = new FormData(form);
                    if (this.data.description) {
                        formData.append("description", this.data.description);
                    }
                    formData.append("status", this.data.status);
                    formData.append("page_title", this.data.page_title);
                    formData.append("sub_title", this.data.sub_title);
                    formData.append("page_id", this.data.page_id);
                    formData.append("type", this.data.type);
                    formData.append("amount", this.data.amount);

                    formData.append("image_base64", this.data.original_image);
                    formData.append(
                        "image_resize_value",
                        this.$root.media_validators?.image?.resize_value ?? ""
                    );
                    if (this.data.id) {
                        this.update(this.model, formData, this.data.id, true);
                    } else {
                        this.store(this.model, formData);
                    }
                }
            });
        },
        pageid() {
            axios.get("support/page").then((response) => {
                this.pageId = response.data;
            });
        },
    },
    created() {
        if (this.$route.params.id) {
            this.get_data(`${this.model}/${this.$route.params.id}`);
            this.page_title = "Page Section Edit";
        } else {
            this.get_sorting("PageSection");
            this.page_title = "Page Section Create";
            if (this.$route.query.page) {
                const parsedPage = parseInt(this.$route.query.page);
                this.data.page_id = !isNaN(parsedPage) ? parsedPage : this.$route.query.page;
            }
        }
        this.pageid();
        this.getMediaValidators("PageSection");
    },

    validators: {
        "data.type": function (value = null) {
            return Validator.value(value).required("Type is required");
        },
        "data.page_id": function (value = null) {
            return Validator.value(value).required("Page is required");
        },
        "data.original_image": function (value = null) {
            if (this.data.type === "image") {
                return Validator.value(value).required("Image is required");
            }
        },
        "data.url": function (value = null) {
            if (this.data.type === "url") {
                return Validator.value(value)
                    .required("URL is required")
                    .url("Please provide a valid URL");
            }
        },
        "data.description": function (value = null) {
            if (this.data.type === "text") {
                return Validator.value(value).required(
                    "Description is required"
                );
            }
        },
        "data.video_url": function (value = null) {
            if (this.data.type === "video") {
                return Validator.value(value)
                    .required("Video URL is required")
                    .url("Please provide a valid Video URL");
            }
        },
        "data.sorting": function (value = null) {
            return Validator.value(value)
                .digit()
                .regex("^[0-9]*$")
                .required("Sorting is required");
        },
    },
};
</script>
