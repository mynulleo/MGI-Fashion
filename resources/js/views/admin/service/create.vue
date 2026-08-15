<template>
    <create-form @onSubmit="submit">
        <File title="Image" cropModalId="logo_crop_modal" field="data.original_image" mime="img" fileClassName="file2"
            :req="false" :showCrop="true" :vHeight="$root.media_validators?.image?.min_height ?? 541"
            :vWidth="$root.media_validators?.image?.min_width ?? 1076"
            :vSizeInKb="$root.media_validators?.image?.max_size ?? 5000" col="3 col-12" />

        <GlobalCrop id="logo_crop_modal" field="data.original_image"
            v-on:update:modelValue="data.original_image = $event" :image="image.original_image" :aspectRatio="{
                aspectRatio:
                    ($root.media_validators?.image?.min_width ?? 600) /
                    ($root.media_validators?.image?.min_height ?? 302),
            }" :minWidth="$root.media_validators?.image?.min_width ?? 1076"
            :minHeight="$root.media_validators?.image?.min_height ?? 541">
        </GlobalCrop>

        <File title="Small Image" cropModalId="image_small_crop_modal" field="data.original_image_small" mime="img"
            :req="false" fileClassName="file2" :showCrop="true"
            :vHeight="$root.media_validators?.image_small?.min_height ?? 52"
            :vWidth="$root.media_validators?.image_small?.min_width ?? 52"
            :vSizeInKb="$root.media_validators?.image_small?.max_size ?? 5000" col="3 col-12" />

        <GlobalCrop id="image_small_crop_modal" field="data.original_image_small"
            v-on:update:modelValue="data.original_image_small = $event" :image="image.original_image_small"
            :aspectRatio="{
                aspectRatio:
                    ($root.media_validators?.image_small?.min_width ?? 52) /
                    ($root.media_validators?.image_small?.min_height ?? 52),
            }" :minWidth="$root.media_validators?.image_small?.min_width ?? 52"
            :minHeight="$root.media_validators?.image_small?.min_height ?? 52">
        </GlobalCrop>

        <div class="row g-3">
            <Input v-model="data.icon" field="data.icon" col="3" title="Icon" :req="false" />
            <Input v-model="data.title" field="data.title" col="6" title="Title" :req="true" />

            <editor v-model="data.description" field="data.description" required title="Description" col="12" />
        </div>
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
        <Switch v-model="data.status" field="data.status" title="status" on-label="Active" off-label="Deactive"
            :req="true">
        </Switch>
    </create-form>
</template>

<script>
import Editor from "../../../components/Form/CKEditor";
const model = "service";

export default {
    components: { Editor },
    data() {
        return {
            model: model,
            page_title: "",
            data: { sorting: 0, status: "active", meta_tag: [] },
            image: { image: "", image_small: "" },
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
                    formData.append("image_base64", this.data.original_image);
                    formData.append(
                        "image_small_base64",
                        this.data.original_image_small
                    );
                    formData.append(
                        "image_resize_value",
                        this.$root.media_validators?.image?.resize_value ?? ""
                    );
                    formData.append(
                        "image_small_resize_value",
                        this.$root.media_validators?.image_small
                            ?.resize_value ?? ""
                    );
                    formData.append("description", this.data.description);
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
        this.getMediaValidators(model);

        if (this.$route.params.id) {
            this.page_title = this.headline(this.model) + " Edit";
            this.get_data(`${this.model}/${this.$route.params.id}`);
        } else {
            this.get_sorting("Service");

            this.page_title = this.headline(this.model) + " Create";
        }
    },

    validators: {
        "data.title": function (value = null) {
            return Validator.value(value)
                .maxLength(191)
                .required("Title is required");
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

    },
};
</script>
