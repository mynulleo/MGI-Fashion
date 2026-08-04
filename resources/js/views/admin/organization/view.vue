<template>
  <view-page :defaultTable="false" :showCreateRoute="false" :showDeleteButton="false">
    <div class="row custom_row g-3">
      <div class="col-xl-6 col-lg-12">
        <OrganizationInfo :data="data" />
      </div>
      <div class="col-lg-6">
        <OfficialInfo :data="data" />
      </div>
      <div class="col-md-6">
        <ProjectInfo :data="data" />
      </div>
      <div class="col-md-6">
        <OrganizationUsers :users="data.organization_users" />
      </div>
      <div class="col-md-12">
        <Invoices :invoices="data.invoice" />
      </div>
      <div class="col-md-6">
        <Statistics :data="data" />
      </div>
      <div class="col-md-6">
        <ActionApproval :data="data" :form="form" @submitted="fetchData" />
      </div>
    </div>
  </view-page>
</template>

<script>
import OrganizationInfo from "./components/OrganizationInfo.vue";
import OfficialInfo from "./components/OfficialInfo.vue";
import ProjectInfo from "./components/ProjectInfo.vue";
import OrganizationUsers from "./components/OrganizationUsers.vue";
import Invoices from "./components/Invoices.vue";
import Statistics from "./components/Statistics.vue";
import ActionApproval from "./components/ActionApproval.vue";

const model = "organization";

export default {
  components: {
    OrganizationInfo,
    OfficialInfo,
    ProjectInfo,
    OrganizationUsers,
    Invoices,
    Statistics,
    ActionApproval
  },
  data() {
    return {
      lodding: false,
      model,
      data: {}
    };
  },
  created() {
    this.fetchData();
  },
  methods: {
    fetchData() {
      this.get_data(`${this.model}/${this.$route.params.id}`);
    }
  }
};
</script>
