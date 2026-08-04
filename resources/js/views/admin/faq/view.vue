<template>
    <view-page :defaultTable="false">
    </view-page>
</template>

<script>
const model = "faq";

export default {
    data() {
        return {
            page_title: "Faq View",
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
