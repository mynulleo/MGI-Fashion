<template>
  <view-page> </view-page>
</template>

<script>

const model = "page";

export default {
  data() {
    return {
        page_title: "Page View",
      model: model,
      data: {

      },
      fileColumns :[],
    };
  },
  created() {
    this.setBreadcrumbs(this.model, "view");
    this.get_data(`${this.model}/${this.$route.params.id}`);
  },
};
</script>
