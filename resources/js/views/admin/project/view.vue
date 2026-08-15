<template>
    <view-page>
        <div class="view_page pb-4">
            <div class="row custom_row g-3">
                <div class="col-xl-6 col-lg-12">
                    <fieldset>
                        <span class="legend">Media</span>
                        <div class="view_file">
                            <div class="row g-4">
                                <div class="col-lg-6">
                                    <div class="view_file_item text-center" style="width: 100%; height: 100%">
                                        <div class="img" style="width: 100%; height: 100%">
                                            <img :src="data?.original_image
                                                ? data?.original_image
                                                : emptyImage()
                                                " alt="img-cover" style="
                                                    width: 100%;
                                                    height: 100%;
                                                    object-fit: cover;
                                                " />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </div>
                <div class="col-xl-6 col-lg-12">
                    <fieldset>
                        <span class="legend">Product Details</span>
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <tbody>
                                    <tr>
                                        <th>Title</th>
                                        <th style="text-align: center">:</th>
                                        <td>{{ ucfirst(data.title ?? "") }}</td>
                                    </tr>
                                    <tr>
                                        <th>Website</th>
                                        <th style="text-align: center">:</th>
                                        <td>{{ ucfirst(data.website ?? "") }}</td>
                                    </tr>
                                    <tr>
                                        <th>Funded By</th>
                                        <th style="text-align: center">:</th>
                                        <td>{{ ucfirst(data.funded_by ?? "") }}</td>
                                    </tr>
                                    <tr>
                                        <th>Start Date</th>
                                        <th style="text-align: center">:</th>
                                        <td>{{ data.start_date ?? "" }}</td>
                                    </tr>
                                    <tr>
                                        <th>End Date</th>
                                        <th style="text-align: center">:</th>
                                        <td>{{ data.end_date ?? "" }}</td>
                                    </tr>
                                    <tr>
                                        <th>Sorting</th>
                                        <th style="text-align: center">:</th>
                                        <td>
                                            {{ ucfirst(data.sorting ?? "") }}
                                        </td>
                                    </tr>

                                    <tr>
                                        <th>Status</th>
                                        <th style="text-align: center">:</th>
                                        <td>
                                            <span :class="[
                                                data?.status == 'active'
                                                    ? 'bg-success'
                                                    : 'bg-danger ',
                                                'badge mt-1 mx-2',
                                                'text-white ',
                                            ]">
                                                {{ ucfirst(data.status) }}
                                            </span>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </fieldset>
                </div>
                <div class="col-xl-12 col-lg-12">
                    <fieldset>
                        <span class="legend"> Description</span>
                        <div class="view_file">
                            <div class="row g-4">
                                <div class="col-lg-12">
                                    <div class="view_file_item" style="width: 100%; height: 100%">
                                        <p class="text" v-html="data?.description"></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>
        </div>
        <div class="view_page">
            <div class="row custom_row g-3">
                <div class="col-xl-12 col-lg-12">
                    <fieldset>
                        <span class="legend">Meta Information</span>
                        <template v-if="
                            (data.meta_tag && data.meta_tag.length) ||
                            data.meta_description
                        ">
                            <div class="col-lg-12 mt-2" v-if="data.meta_tag && data.meta_tag.length">
                                <button class="btn btn-light border" v-for="(item, index) in data.meta_tag"
                                    :key="index">
                                    {{ item }}
                                </button>
                            </div>
                            <div class="col-lg-12 mt-2" v-if="data.meta_description">
                                <p>
                                    {{ data.meta_description }}
                                </p>
                            </div>
                        </template>
                        <template v-else>
                            <div class="col-lg-12 mt-2 text-center">
                                <p>No meta info found</p>
                            </div>
                        </template>
                    </fieldset>
                </div>
            </div>
        </div>
    </view-page>
</template>

<script>
const model = "project";
export default {
    data() {
        return {
            page_title: "Product View",
            model: model,
            data: {},
            fileColumns: [
                {
                    field: "original_image",
                    title: "Image",
                },
            ],
        };
    },
    created() {
        this.setBreadcrumbs(this.model, "view");
        this.get_data(`${this.model}/${this.$route.params.id}`);
    },
};
</script>
