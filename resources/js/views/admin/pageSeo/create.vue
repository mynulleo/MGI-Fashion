<template>
    <create-form @onSubmit="submit">
        <div class="col-xl-3 col-lg-4">
            <File
                title="Image"
                field="data.original_image"
                mime="img"
                fileClassName="file2"
                :showCrop="true"
                :req="true"
                :vHeight="$root.media_validators?.image?.min_height ?? 600"
                :vWidth="$root.media_validators?.image?.min_width ?? 600"
                :vSizeInKb="$root.media_validators?.image?.max_size ?? 5000"
                col="12 col-12"
            />
            <GlobalCrop
                field="data.original_image"
                v-on:update:modelValue="data.original_image = $event"
                :image="image.original_image"
                :aspectRatio="{
                    aspectRatio:
                        ($root.media_validators?.image?.min_width ?? 600) /
                        ($root.media_validators?.image?.min_height ?? 600),
                }"
                :minWidth="$root.media_validators?.image?.min_width ?? 600"
                :minHeight="$root.media_validators?.image?.min_height ?? 600"
            >
            </GlobalCrop>
        </div>
        <Select
            field="data.page_id"
            title="Select Page"
            v-model="data.page_id"
            label="title"
            :reduce="(obj) => obj.id"
            :options="pages"
            placeholder="--Select One--"
            :closeOnSelect="true"
            :req="true"
        />
        <Input
            title="Sorting"
            field="data.sorting"
            v-model="data.sorting"
            col="4 col-xl-3"
            type="number"
            :req="true"
        />

        <div class="col-lg-12">
            <Fieldset>
                <template v-slot:name>Meta Information</template>
                <template v-slot:content>
                    <div class="row g-3">
                        <div class="col-12">
                            <x-multiple-select
                                v-model="data.meta_tag"
                                field="data.meta_tag"
                                title="Meta Keywords"
                                required
                                col="12"
                            />
                        </div>
                        <div class="col-12">
                            <div class="form-element">
                                <label for="" class="form-label"
                                    >Meta Description</label
                                >
                                <textarea
                                    name="meta_description"
                                    v-model="data.meta_description"
                                    class="form-control"
                                    id=""
                                    cols="30"
                                    rows="4"
                                    required
                                ></textarea>
                            </div>
                        </div>
                    </div>
                </template>
            </Fieldset>
        </div>
        <Switch
            v-model="data.status"
            field="data.status"
            title="Status"
            on-label="Active"
            off-label="Deactive"
            :req="true"
        >
        </Switch>
    </create-form>
</template>

<script>
import axios from "axios";

const model = "pageSeo";

export default {
    data() {
        return {
            page_title: "",
            model: model,
            data: {
                original_image: "",
                meta_tag: [],
                meta_description: "",
                status: "active",
                sorting: 0,
            },
            is_meta: false,
            pages: "",
            image: { original_image: "" },
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
                    formData.append("page_id", this.data.page_id);
                    formData.append("status", this.data.status);

                    if (this.data.meta_tag && this.data.meta_tag.length > 0) {
                        formData.append(
                            "meta_tag",
                            JSON.stringify(this.data.meta_tag)
                        );
                    } else {
                        formData.append("meta_tag", JSON.stringify([]));
                    }
                    if (this.data.original_image) {
                        formData.append(
                            "image_base64",
                            this.data.original_image
                        );
                    }
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
        // track of meta
        updateIsMeta() {
            this.is_meta =
                !!(this.data.meta_tag && this.data.meta_tag.length > 0) ||
                !!(
                    this.data.meta_description &&
                    this.data.meta_description.trim() !== ""
                );
        },
        // All Api
        getPages() {
            axios
                .get("support/page")
                .then((res) => {
                    this.pages = res.data;
                })
                .catch((error) => {
                    console.error("Error fetching pages:", error);
                });
        },
    },

    watch: {
        "data.meta_tag": function (newVal) {
            this.updateIsMeta();
        },
        "data.meta_description": function (newVal) {
            this.updateIsMeta();
        },
    },

    created() {
        this.getPages();
        this.updateIsMeta();
        if (this.$route.params.id) {
            this.page_title = "Page SEO Edit";
            this.get_data(`${this.model}/${this.$route.params.id}`);
        } else {
            this.page_title = "Page SEO Create";
            this.get_sorting("PageSeo");
        }
        this.getMediaValidators("PageSeo");
    },

    validators: {
        "data.page_id": function (value = null) {
            return Validator.value(value).required("Page is required");
        },
        "data.status": function (value = null) {
            return Validator.value(value).required("Status is required");
        },
        "data.meta_tag": function (value = null) {
            return Validator.value(value).required("Meta Tag is required");
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
