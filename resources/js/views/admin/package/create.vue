<template>
  <create-form @onSubmit='submit'>
    <Input v-model='data.title' field='data.title' title='Title' :req='true' col="3" />
    <date-picker id='date1' v-model='data.start_date' field='data.start_date' title='Start Date'
      placeholder='Start Date' col='2' :req='true'></date-picker>
    <Input v-model='data.registration_fee' field='data.registration_fee' title='Registration Fee' :req='true' col="2" />
    <Input v-model='data.free_month' field='data.free_month' title='Free Month' col="1" />
    <Input v-model='data.price' field='data.price' title='Monthly Price' :req='true' col="2" />
    <Input v-model='data.yearly_price' field='data.yearly_price' title='Yearly Price' :req='true' col="2" />
    <Input v-model='data.floor' field='data.floor' title='Floor' :req='true' col="2" />
    <Input v-model='data.flat' field='data.flat' title='Flat' :req='true' col="2" />
    <SwitchBoolean v-model="data.schedule_invoice" field="data.schedule_invoice" title="Schedule Invoice" onLabel='On'
      offLabel='Off' col="2">
    </SwitchBoolean>
    <SwitchBoolean v-model="data.sms" field="data.sms" title="SMS" onLabel='On' offLabel='Off' col="2"></SwitchBoolean>
    <SwitchBoolean v-model="data.reminder_sms" field="data.reminder_sms" title="Reminder SMS" onLabel='On'
      offLabel='Off' col="2">
    </SwitchBoolean>
    <SwitchBoolean v-model='data.display_web' field='data.display_web' title='Display Web?' onLabel='On' offLabel='Off'
      col="2"></SwitchBoolean>
    <Switch v-model='data.status' field='data.status' title='status' on-label='Active' off-label='Deactive' :req='true'
      col="2"></Switch>
    <Textarea v-model='data.feature' field='data.feature' :required='true' title="Remarks" col="12" />

  </create-form>
</template>

<script>


const model = 'package';

export default {

  data() {
    return {
      model: model,
      page_title: '',
      data: {},

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
          formData.append('start_date', this.data.start_date);
          formData.append('feature', this.data.feature);
          formData.append('schedule_invoice', this.data.schedule_invoice);
          formData.append('sms', this.data.sms);
          formData.append('remainder_sms', this.data.remainder_sms);

          if (this.data.id) {
            this.update(this.model, this.data, this.data.id);
          } else {
            this.store(this.model, this.data);
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
    'data.title': function (value = null) { return Validator.value(value).required('Title is required'); },
    'data.start_date': function (value = null) { return Validator.value(value).required('Start Date is required'); },
    'data.price': function (value = null) { return Validator.value(value).required('Price is required'); },
    'data.feature': function (value = null) { return Validator.value(value).required('Feature is required'); },

  },
}

</script>