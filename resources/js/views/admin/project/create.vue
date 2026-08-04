<template>
    <create-form @onSubmit="submit">
        <div class="col-md-3">
            <div class="row g-3">
                <File title="Image" cropModalId="logo_crop_modal" field="data.original_image" mime="img"
                    fileClassName="file2" :req="true" :showCrop="true"
                    :vHeight="$root.media_validators?.image?.min_height ?? 526"
                    :vWidth="$root.media_validators?.image?.min_width ?? 856"
                    :vSizeInKb="$root.media_validators?.image?.max_size ?? 5000" col="12" />

                <GlobalCrop id="logo_crop_modal" field="data.original_image"
                    v-on:update:modelValue="data.original_image = $event" :image="image.original_image" :aspectRatio="{
                        aspectRatio:
                            ($root.media_validators?.image?.min_width ?? 416) /
                            ($root.media_validators?.image?.min_height ?? 256),
                    }" :minWidth="$root.media_validators?.image?.min_width ?? 856"
                    :minHeight="$root.media_validators?.image?.min_height ?? 526">
                </GlobalCrop>
            </div>
        </div>
        <div class="col-md-9">
            <div class="row g-3">
                <Input v-model="data.title" field="data.title" title="Title" col="6" :req="true" />
                <date-picker id="date2" v-model="data.start_date" field="data.start_date" title="Start Date"
                    placeholder="Start Date" col="3"></date-picker>
                <date-picker id="date3" v-model="data.end_date" field="data.end_date" title="End Date"
                    placeholder="End Date" col="3"></date-picker>
                <Select field="data.category_id" title="Category" col="6 col-xxl-3" v-model="data.category_id"
                    label="title" :reduce="(obj) => obj.id" :options="categories" placeholder="--Select One--"
                    :closeOnSelect="true" :req="true" />
                <Input v-model="data.website" field="data.website" title="Website" col="3" :req="false" />
                <Input v-model="data.funded_by" field="data.funded_by" title="Funded By" col="3" :req="false" />

            </div>
        </div>



        <editor v-model="data.description" field="data.description" required title="Description" col="12" />

        <div class="col-lg-12">
            <Fieldset>
                <template v-slot:name>Meta Information</template>
                <template v-slot:content>
                    <div class="row g-3">
                        <div class="col-12">
                            <x-multiple-select v-model="data.meta_tag" field="data.meta_tag" title="Meta Keywords"
                                required col="12" />
                        </div>
                        <div class="col-12">
                            <div class="form-element">
                                <Textarea title="Meta Description" field="data.meta_description"
                                    v-model="data.meta_description" :req="true" col="12" />
                            </div>
                        </div>
                    </div>
                </template>
            </Fieldset>
        </div>

        <Input v-model="data.sorting" field="data.sorting" name="sorting" title="Sorting" type="number" col="2"
            :req="true" />
        <SwitchBoolean v-model="data.enable_login_system" field="data.enable_login_system" title="Enable Login System"
            on-label="Yes" off-label="No" :req="true" col="3"></SwitchBoolean>
        <Switch v-model="data.status" field="data.status" title="status" on-label="Active" off-label="Deactive"
            :req="true" col="3"></Switch>
    </create-form>
</template>

<script>
import Editor from "../../../components/Form/CKEditor";
import axios from "axios";
const model = "project";

export default {
    components: { Editor },

    data() {
        return {
            model: model,
            page_title: "",
            data: {
                sorting: 0,
                category_id: null,
                status: "active",
                meta_tag: [],
                enable_login_system: 0
            },
            categories: [],
            image: { image: "" },
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
        getcategory() {
            axios.get("/getcategory").then((response) => {
                console.log(response.data);
                this.categories = response.data;
            });
        },
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
                    formData.append("image_base64", this.data.original_image);
                    formData.append(
                        "image_resize_value",
                        this.$root.media_validators?.image?.resize_value ?? ""
                    );
                    formData.append("description", this.data.description);
                    formData.append("category_id", this.data.category_id);
                    formData.append("start_date", this.data.start_date);
                    formData.append("end_date", this.data.end_date);
                    formData.append("enable_login_system", this.data.enable_login_system);
                    formData.append("status", this.data.status);
                    if (this.data.meta_tag && this.data.meta_tag.length > 0) {
                        formData.append(
                            "meta_tag",
                            JSON.stringify(this.data.meta_tag)
                        );
                    }
                    formData.append(
                        "meta_description",
                        this.data.meta_description
                    );
                    if (this.data.id) {
                        this.update(this.model, formData, this.data.id, true);
                    } else {
                        this.store(this.model, formData);
                    }
                }
            });
        },
    },
    created() {
        this.getcategory();
        this.getMediaValidators("Project");
        if (this.$route.params.id) {
            this.page_title = this.headline(this.model) + " Edit";
            this.get_data(`${this.model}/${this.$route.params.id}`);
        } else {
            this.get_sorting("Project");

            this.page_title = this.headline(this.model) + " Create";
        }
    },

    validators: {
        "data.title": function (value = null) {
            return Validator.value(value)
                .maxLength(191)
                .required("Title is required");
        },
        "data.category_id": function (value = null) {
            return Validator.value(value).required("Category is required");
        },

        "data.description": function (value = null) {
            return Validator.value(value).required("Description is required");
        },
        "data.sorting": function (value = null) {
            return Validator.value(value).required("Sorting is required");
        },
        "data.meta_tag": function (value = null) {
            return Validator.value(value).required("Meta tag is required");
        },
        "data.meta_description": function (value = null) {
            return Validator.value(value).required(
                "Meta description is required"
            );
        },
        "data.original_image": function (value = null) {
            return Validator.value(value).required("Image is required");
        },
    },
};
</script>
