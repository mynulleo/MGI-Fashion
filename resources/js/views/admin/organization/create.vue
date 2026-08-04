<template>
  <create-form @onSubmit='submit'>
    <div class="row custom_row">
      <div class="col-lg-12">
        <fieldset>
          <span class="legend">Organization Info</span>
          <div class="row g-3 pt-2">
            <Input v-model='data.organization_name' field='data.organization_name' title='Organization Name' col="12"
              :req='true' />
            <!-- <Input v-model='data.floor' field='data.organization_name' title='Total Floor' :req='true' col="2" />
            <Input v-model='data.flat' field='data.organization_name' title='Total Flat' :req='true' col="2" /> -->
            <Textarea v-model='data.address' field='data.address' :required='true' title="Address" col="12" />
          </div>
        </fieldset>
      </div>
      <div class="col-lg-6">
        <fieldset>
          <span class="legend">Owner Info</span>
          <div class="row g-3 pt-2">
            <Input v-model='data.owner_name' field='data.owner_name' title='Owner Name' :req='true' />
            <Input v-model='data.nid' field='data.nid' title='Nid' :req='true' />
            <Input v-model='data.mobile' field='data.mobile' title='Mobile' :req='true' />
            <Input v-model='data.email' field='data.email' title='Email' :req='true' />
          </div>
        </fieldset>
      </div>
      <div class="col-lg-6">
        <fieldset>
          <span class="legend">System Info</span>
          <div class="row g-3 pt-2">
            <Select title='Project' v-model='data.project_id' field='data.project_id' label='title'
              :reduce='(obj) => obj.id' :options='$root.global.projects' placeholder='--Select One--'
              :closeOnSelect='true' :required='true' />
            <date-picker id='date6' v-model='data.reg_date' field='data.reg_date' title='Reg Date'
              placeholder='Reg Date' col='3' :req='false'></date-picker>
            <date-picker id='date7' v-model='data.expired_date' field='data.expired_date' title='Expired Date'
              placeholder='Expired Date' col='3' :req='false'></date-picker>
            <Input v-model='data.host' field='data.host' title='Host' />
            <Input v-model='data.db_name' field='data.db_name' title='Database name' />
            <Input v-model='data.db_user' field='data.db_user' title='Database user' />
            <Input v-model='data.db_password' field='data.db_password' title='Password' />
          </div>
        </fieldset>
      </div>
      <div class="col-lg-12">
        <Switch v-model='data.status' field='data.status' title='status' on-label='Active' off-label='Deactive'
          :req='true'>
        </Switch>
      </div>
    </div>
  </create-form>
</template>

<script>
import Editor from '../../../components/Form/CKEditor';

const model = 'organization';

export default {
  components: { Editor },
  data() {
    return {
      model: model,
      page_title: '',
      data: {
        reg_date: null,
        expired_date: null
      },

    };
  },

  provide() {
    return {
      validate: this.validation,

    };
  },
  methods: {
    submit: function (e) {
      this.$validate().then((res) => {
        const error = this.validation.countErrors();

        if (error > 0) {
          console.log(this.validation.allErrors());
          this.$toast(
            'You need to fill ' + error + ' more empty mandatory fields',
            'warning'
          );
          return false;
        }

        if (res) {
          var form = document.getElementById('form');
          var formData = new FormData(form);
          formData.append('address', this.data.address);
          formData.append('project_id', this.data.project_id);
          formData.append('reg_date', this.data.reg_date);
          formData.append('expired_date', this.data.expired_date);
          formData.append('status', this.data.status);
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
    if (this.$route.params.id) {
      this.page_title = this.headline(this.model) + ' Edit';
      this.get_data(`${this.model}/${this.$route.params.id}`);
    } else {
      this.page_title = this.headline(this.model) + ' Create';
    }
  },

  validators: {
    'data.organization_name': function (value = null) { return Validator.value(value).required('Organization Name is required'); },
    'data.owner_name': function (value = null) { return Validator.value(value).required('Owner Name is required'); },
    'data.address': function (value = null) { return Validator.value(value).required('Address is required'); },
    'data.mobile': function (value = null) { return Validator.value(value).required('Mobile is required').digit().minLength(11).maxLength(11); },
    'data.email': function (value = null) { return Validator.value(value).required('Email is required').email(); },
    'data.project_id': function (value = null) { return Validator.value(value).required('Project is required'); },
    'data.nid': function (value = null) { return Validator.value(value).required('Nid is required'); },
  },
}

</script>