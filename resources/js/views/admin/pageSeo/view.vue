<template>
    <view-page :defaultTable="false">
        <div class="view_page">
            <div class="row custom_row g-3">
                <div class="col-xl-4 col-lg-12">
                    <fieldset>
                        <span class="legend">Media</span>
                        <div class="view_file">
                            <div class="row g-4">
                                <div class="col-lg-12">
                                    <div class="view_file_item text-center" style="width: 100%; height: 100%;">
                                        <div class="img" style="width: 100%; height: 100%;">
                                            <img :src="data?.image_two == 'no_server_image' ? emptyServerImage() : (data?.image_two || emptyImage())" alt="img-cover"
                                                style="width: 100%; height: 100%; object-fit: cover;">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </div>
                <div class="col-xl-8 col-lg-12">
                    <fieldset>
                        <span class="legend">Information</span>
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <tbody>
                                    <tr>
                                        <th>Page Name</th>
                                        <th style="text-align: center">:</th>
                                        <td>{{ ucfirst(data?.page?.title ?? " ") }}</td>
                                    </tr>
                                    <tr>
                                        <th>Meta Tags</th>
                                        <th style="text-align: center">:</th>
                                        <td>{{ data?.meta_tag ?? " " }}</td>
                                    </tr>
                                    <tr>
                                        <th>Meta Description</th>
                                        <th style="text-align: center">:</th>
                                        <td>{{ data?.meta_description ?? " " }}</td>
                                    </tr>
                                    <tr>
                                        <th>Sorting</th>
                                        <th style="text-align: center">:</th>
                                        <td>{{ data?.sorting ?? " " }}</td>
                                    </tr>
                                    <tr>
                                        <th>Status</th>
                                        <th style="text-align: center">:</th>
                                        <td>
                                            <span :class="[
                                                data?.status == 'active' ? 'bg-success' : 'bg-danger ',
                                                'badge mt-1 mx-2',
                                                'text-white ',
                                            ]">
                                                {{ ucfirst(data?.status) }}
                                            </span>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </fieldset>
                </div>
            </div>
        </div>
    </view-page>
</template>

<script>
const model = "pageSeo";

export default {
    data() {
        return {
            page_title: "Page SEO View",
            model: model,
            data: {},
            fileColumns: [],
        };
    },
    created() {
        this.setBreadcrumbs(this.model, "view");
        this.get_data(`${this.model}/${this.$route.params.id}`);
    },
};
</script>
