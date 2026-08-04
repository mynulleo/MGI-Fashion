<template>
  <div class="row">
    <create-form @onSubmit='submit'>
      <div class="col-md-8 mb-5">
        <div class="row">
          <div class="col-md-12">

            <fieldset>
              <span class="legend">Invoice</span>
              <div class="row g-3">
                <Input v-model="data.saasno" field="data.saasno" title="Organization No" :req="true"
                  @keyup.enter="fetchOrganizationData" />

                <hr class="mt-2" />

                <date-picker id="date2" v-model="data.invoice_date" field="data.invoice_date" title="Invoice Date"
                  placeholder="Invoice Date" col="3" :req="false"></date-picker>
                <Input v-model="data.original_amount" field="data.original_amount" title="Amount" col="3"
                  :readonly="true" :req="true" />
                <Input v-model="data.discount" field="data.discount" title="Discount" col="3" />
                <Input v-model="data.amount" field="data.amount" title="Total" col="3" :req="true" :readonly="true" />

                <hr class="mt-2" />

                <date-picker v-if="data.payment_status == 'paid'" id="date5" v-model="data.payment_date"
                  field="data.payment_date" title="Payment Date" placeholder="Payment Date" col="3"
                  :req="false"></date-picker>

                <Input v-if="data.payment_status == 'paid'" v-model="data.paid_amount" field="data.paid_amount" col="3"
                  title="Paid Amount" :req="false" />

                <Input v-if="data.payment_status == 'paid'" v-model="data.trxid" field="data.trxid" title="Trxid"
                  :req="false" />

                <Select v-if="data.payment_status == 'paid'" title="Payment Status" v-model="data.payment_status"
                  field="data.payment_status" label="name" :reduce="(obj) => obj.value"
                  :options="$root.global.payment_status" placeholder="--Select One--" :closeOnSelect="true"
                  :required="false" />

                <Switch v-model="data.status" field="data.status" title="Status" on-label="Active" off-label="Deactive"
                  :req="true"></Switch>

              </div>
            </fieldset>

          </div>
          <div class="col-md-12">
            <fieldset class="mt-4">
              <span class="legend">Invoice Details</span>
              <div class="row">
                <div class="col-md-12">
                  <table class="table">
                    <thead>
                      <tr>
                        <th style="width:5%">Sl</th>
                        <th style="width:35%">Account Head</th>
                        <th style="width:30%">Amount</th>
                        <th style="width:20%"></th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr v-for="(invdetail, index) in data.invoice_details" :key="index">
                        <td>{{ index + 1 }}</td>
                        <td>
                          <Select v-model="invdetail.account_head_id" field="invdetail.account_head_id" label="title"
                            :reduce="(obj) => obj.id" :options="$root.global.account_heads" placeholder="--Select One--"
                            :closeOnSelect="true" :required="false" col="12" />
                        </td>
                        <td>
                          <Input v-model="invdetail.amount" field="invdetail.amount" col="12" />
                        </td>
                        <td>
                          <div class="multiple_fields_actions_btn d-flex align-items-center gap-2">
                            <button type="button" class="btns delete_one" data-bs-toggle="tooltip"
                              data-bs-placement="top" data-bs-title="Delete" v-x-tooltip @click.prevent="
                                removeInvoiceDetails(index)
                                " v-if="
                                  Object.keys(
                                    data.invoice_details
                                  ).length > 1
                                ">
                              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                stroke-linejoin="round" class="icon icon-tabler icons-tabler-outline icon-tabler-trash"
                                data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Delete" v-x-tooltip>
                                <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                <path d="M4 7l16 0" />
                                <path d="M10 11l0 6" />
                                <path d="M14 11l0 6" />
                                <path d="M5 7l1 12a2 2 0 0 0 2 2h8a2 2 0 0 0 2 -2l1 -12" />
                                <path d="M9 7v-3a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v3" />
                              </svg>
                            </button>
                            <button v-if="isLastItem(data.invoice_details, index)" type="button" class="btns add_more"
                              data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Add" v-x-tooltip
                              @click.prevent="addInvoiceDetailsRow()">
                              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                stroke-linejoin="round" class="icon icon-tabler icons-tabler-outline icon-tabler-plus">
                                <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                <path d="M12 5l0 14" />
                                <path d="M5 12l14 0" />
                              </svg>
                            </button>
                          </div>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </fieldset>
          </div>
        </div>

      </div>
      <div class="col-md-4 mb-5">
        <fieldset>
          <span class="legend">Organization Info</span>
          <div class="table-responsive">
            <table class="table table-striped">
              <tbody>
                <tr>
                  <th width="45%">Organization Name</th>
                  <th width="5">:</th>
                  <td width="50%">{{ data?.Organization?.Organization_name }}</td>
                </tr>
                <tr>
                  <th>Owner Name</th>
                  <th>:</th>
                  <td>{{ data?.Organization?.owner_name }}</td>
                </tr>
                <tr>
                  <th>Package</th>
                  <th>:</th>
                  <td>{{ data?.Organization?.package?.title }}</td>
                </tr>
                <tr>
                  <th>Mobile</th>
                  <th>:</th>
                  <td>{{ data?.Organization?.mobile }}</td>
                </tr>
                <tr>
                  <th>Email</th>
                  <th>:</th>
                  <td>{{ data?.Organization?.email }}</td>
                </tr>
                <tr>
                  <th>Address</th>
                  <th>:</th>
                  <td>{{ data?.Organization?.address }}</td>
                </tr>
              </tbody>
            </table>
          </div>
          <!-- এখানে প্রয়োজনে Organization সম্পর্কিত input/field যোগ করা যাবে -->
        </fieldset>
      </div>
    </create-form>
  </div>
</template>

<script>


const model = 'invoice';

export default {

  data() {
    return {
      model: model,
      page_title: '',
      data: {
        original_amount: 0,
        discount: 0,
        amount: 0,
        Organization: {},
        invoice_details: [
          {
            account_head_id: '',
            amount: ''
          }
        ]
      },

    };
  },

  provide() {
    return {
      validate: this.validation,

    };
  },
  watch: {
    'data.original_amount': {
      handler(newVal) {
        let discount = 0;
        if (this.data.discount) {
          discount = this.data.discount;
        }
        this.data.amount = this.data.original_amount - this.data.discount
      }
    },
    'data.discount': {
      handler(newVal) {
        let discount = 0;
        if (this.data.discount) {
          discount = this.data.discount;
        }
        this.data.amount = this.data.original_amount - this.data.discount
      }
    },
    'data.invoice_details': {
      handler(newVal) {
        // sum all amounts
        const total = newVal.reduce((sum, item) => {
          // parseFloat দিয়ে ensure number
          const amt = parseFloat(item.amount) || 0; // <-- change here
          return sum + amt;
        }, 0);

        // update invoice original_amount
        this.data.original_amount = total;
      },
      deep: true, // nested changes detect করার জন্য
      immediate: true // page load এও apply হবে
    }
  },
  methods: {
    submit: function (e) {
      this.$validate().then((res) => {
        const error = this.validation.countErrors();

        if (error > 0) {
          this.$toast(
            'You need to fill ' + error + ' more empty mandatory fields',
            'warning'
          );
          return false;
        }

        if (res) {
          var form = document.getElementById('form');
          var formData = new FormData(form);
          formData.append('invoice_date', this.data.invoice_date);
          formData.append('payment_date', this.data.payment_date);
          if (this.data.id) {
            this.update(this.model, this.data, this.data.id);
          } else {
            this.store(this.model, this.data);
          }
        }
      });
    },
    // New method to fetch Organization data
    async fetchOrganizationData() {
      if (!this.data.saasno) return;

      try {
        // controller/API call example
        const response = await axios.get(`/Organizationinfo/${this.data.saasno}`);

        if (response && response.data) {
          // fetched data push to data.Organization
          this.data.Organization = response.data;
          this.$toast('Organization data loaded successfully', 'success');
        } else {
          this.data.Organization = {};
          this.$toast('No data found for this Organization No', 'warning');
        }
      } catch (error) {
        console.error(error);
        this.$toast('Error fetching Organization data', 'error');
      }
    },
    addInvoiceDetailsRow() {
      this.data.invoice_details.push({
        account_head_id: "",
        amount: 0,
      });
    },
    removeInvoiceDetails(index) {
      if (Object.keys(this.data.invoice_details).length > 1) {
        this.data.invoice_details.splice(index)
      }
    },
    isLastItem(items, index) {
      return index === items.length - 1;
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
    'data.amount': function (value = null) { return Validator.value(value).required('Amount is required'); },

  },
}

</script>