<template>
  <create-form @onSubmit='submit'>
    <Input v-model='data.title' field='data.title' title='Title' :req='true' col="12" />
    <Input v-model='data.code' field='data.code' title='Code' :req='true' col="2" />
    <Input v-model='data.percentage' field='data.percentage' title='Percentage' :req='false' col="3" />
    <Input v-model='data.amount' field='data.amount' title='Amount' col="3" />
    <date-picker id='date4' v-model='data.start_date' field='data.start_date' title='Start Date'
      placeholder='Strat Date' col='2' :req='false'></date-picker>
    <date-picker id='date5' v-model='data.end_date' field='data.end_date' title='End Date' placeholder='End Date'
      col='2' :req='true'></date-picker>
    <Switch v-model='data.status' field='data.status' title='status' on-label='Active' off-label='Deactive' :req='true'>
    </Switch>

  </create-form>
</template>

<script>


const model = 'promoCode';

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
          var form = document.getElementById("form");
          var formData = new FormData(form);
          formData.append('start_date', this.data.start_date); formData.append('end_date', this.data.end_date);
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
    'data.code': function (value = null) { return Validator.value(value).required('Code is required'); },
    'data.start_date': function (value = null) { return Validator.value(value).required('Start Date is required'); },
    'data.end_date': function (value = null) { return Validator.value(value).required('End Date is required'); },

  },
}

</script>