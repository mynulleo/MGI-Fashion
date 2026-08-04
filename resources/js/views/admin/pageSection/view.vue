<template>
    <view-page>
        <div class="view_page pb-4">
            <div class="row custom_row g-3">
                <div class="col-xl-4 col-lg-12">
                    <fieldset>
                        <span class="legend">Media</span>
                        <div class="view_file">
                            <div class="row g-4">
                                <div class="col-lg-12">
                                    <div class="view_file_item text-center" style="width: 100%; height: 100%;">
                                        <div class="img" style="width: 100%; height: 100%;">
                                            <img :src="data?.image_one == 'no_server_image' ? emptyServerImage() : (data?.image_one || emptyImage())" alt="img-cover"
                                                style="width: 100%; height: 100%; object-fit: cover;">
                                        </div>
                                    </div>
                                </div>
                                <!-- <div class="col-lg-12">
                                    <div class="view_file_item text-center" style="width: 100%; height: 100%;">
                                        <div class="img" style="width: 100%; height: 100%;">
                                            <img :src="data?.icon == 'no_server_image' ? emptyServerImage() : (data?.icon || emptyImage())" alt="img-cover"
                                                style="width: 100%; height: 100%; object-fit: cover;">
                                        </div>
                                    </div>
                                </div> -->
                            </div>
                        </div>
                    </fieldset>
                </div>

                <div class="col-xl-8 col-lg-12">
                    <fieldset>
                        <span class="legend">Page Section Details</span>
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <tbody>
                                    <tr>
                                        <th>Title</th>
                                        <th style="text-align: center;">:</th>
                                        <td>{{ data?.title ?? "" }}</td>
                                    </tr>
                                    <tr>
                                        <th>Page Name</th>
                                        <th style="text-align: center;">:</th>
                                        <td>{{ ucfirst(data?.page?.title) }}</td>
                                    </tr>
                                    <tr>
                                        <th>Page Type</th>
                                        <th style="text-align: center;">:</th>
                                        <td>{{ ucfirst(data?.type ?? "") }}</td>
                                    </tr>
                                    <tr v-if="data.description">
                                        <th>Description</th>
                                        <th style="text-align: center;">:</th>
                                        <td>
                                            <p class="text" v-html="data?.description"></p>
                                        </td>


                                    </tr>

                                    <tr v-if="data.url">
                                        <th>Url</th>
                                        <th style="text-align: center;">:</th>
                                        <td><a :href="data?.url" target="_blank">{{ data?.url }}</a></td>
                                    </tr>
                                    <tr v-if="data.video_url">
                                        <th>Video Url</th>
                                        <th style="text-align: center;">:</th>
                                        <td><a :href="data?.video_url" target="_blank">{{ data?.video_url }}</a></td>
                                    </tr>
                                    <tr>
                                        <th>Status</th>
                                        <th style="text-align: center;">:</th>
                                        <td><span :class="[
                                            data?.status == 'active'
                                                ? 'bg-success'
                                                : 'bg-danger ',
                                            'badge mt-1 mx-2',
                                            'text-white ',
                                        ]">
                                                {{ ucfirst(data?.status) }}
                                            </span></td>
                                    </tr>
                                    <tr>
                                        <th>Created At </th>
                                        <th style="text-align: center;">:</th>
                                        <td>{{ data?.created_at ?? "" }}</td>
                                    </tr>
                                    <tr>
                                        <th>Updated At</th>
                                        <th style="text-align: center;">:</th>
                                        <td>{{ data?.updated_at ?? "" }}</td>
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

const model = "pageSection";

export default {
    data() {
        return {
            page_title: "Page Section View",
            model: model,
            data: {

            },
            fileColumns: [],
        };
    },
    created() {
        this.setBreadcrumbs(this.model, "view");
        this.get_data(`${this.model}/${this.$route.params.id}`);
    },
};
</script>
