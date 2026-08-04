<template>
  <view-page :defaultTable="false" :showCreateRoute="false" :showDeleteButton="false">
    <div class="row custom_row g-3">
      <div class="col-md-6">
        <fieldset>
          <span class="legend">Information</span>
          <div class="table-responsive">
            <table class="table table-striped">
              <tbody>
                <tr>
                  <th class="view_t_head">Id</th>
                  <th style="text-align: center; width: 2%;">:</th>
                  <td>{{ data.id }}</td>
                </tr>
                <tr>
                  <th class="view_t_head">Invoice No</th>
                  <th style="text-align: center;">:</th>
                  <td>{{ data.invoice_no ?? '' }}</td>
                </tr>
                <tr>
                  <th class="view_t_head">Invoice Date</th>
                  <th style="text-align: center;">:</th>
                  <td>{{ data.invoice_date ?? '' }}</td>
                </tr>
                <tr>
                  <th class="view_t_head">Original Amount</th>
                  <th style="text-align: center;">:</th>
                  <td>{{ data.original_amount ?? '' }}</td>
                </tr>
                <tr>
                  <th class="view_t_head">Discount</th>
                  <th style="text-align: center;">:</th>
                  <td>{{ data.discount ?? '' }}</td>
                </tr>
                <tr>
                  <th class="view_t_head">Amount</th>
                  <th style="text-align: center;">:</th>
                  <td>{{ data.amount }}</td>
                </tr>
                <tr>
                  <th class="view_t_head">Promo Code</th>
                  <th style="text-align: center;">:</th>
                  <td>{{ data.promo_code }}</td>
                </tr>
                <tr>
                  <th class="view_t_head">Paid Amount</th>
                  <th style="text-align: center;">:</th>
                  <td>{{ data.paid_amount }}</td>
                </tr>
                <tr>
                  <th class="view_t_head">Payment Date</th>
                  <th style="text-align: center;">:</th>
                  <td>{{ data.payment_date }}</td>
                </tr>
                <tr>
                  <th class="view_t_head">Trxid</th>
                  <th style="text-align: center;">:</th>
                  <td>{{ data.trxid }}</td>
                </tr>
                <tr>
                  <th class="view_t_head">Card Type</th>
                  <th style="text-align: center;">:</th>
                  <td class="text-capitalize">{{ data.card_type }}</td>
                </tr>
                <tr>
                  <th class="view_t_head">Payment Status</th>
                  <th style="text-align: center;">:</th>
                  <td class="text-capitalize">{{ data.payment_status }}</td>
                </tr>
                <tr>
                  <th class="view_t_head">Created At</th>
                  <th style="text-align: center;">:</th>
                  <td><span>{{ data.created_at }}</span></td>
                </tr>
                <tr>
                  <th class="view_t_head">Updated At</th>
                  <th style="text-align: center;">:</th>
                  <td><span>{{ data.updated_at }}</span></td>
                </tr>
                <tr>
                  <th class="view_t_head">Status</th>
                  <th style="text-align: center;">:</th>
                  <td class="text-capitalize">{{ data.status }}</td>
                </tr>
              </tbody>
            </table>
          </div>
        </fieldset>
      </div>
      <div class="col-md-6">
        <div class="row g-4">
          <div class="col-md-12">
            <fieldset>
              <span class="legend">Organization Information</span>
              <div class="table-responsive">
                <table class="table table-striped">
                  <tbody>
                    <tr>
                      <th class="view_t_head">Organization No</th>
                      <th style="text-align: center; width:2%">:</th>
                      <td>{{ data.Organization?.saasno }}</td>
                    </tr>
                    <tr>
                      <th class="view_t_head">Organization Name</th>
                      <th style="text-align: center;">:</th>
                      <td>{{ data.Organization?.Organization_name }}</td>
                    </tr>
                    <tr>
                      <th class="view_t_head">Reg Date</th>
                      <th style="text-align: center;">:</th>
                      <td>{{ data.Organization?.reg_date }}</td>
                    </tr>
                    <tr>
                      <th class="view_t_head">Expired Date</th>
                      <th style="text-align: center;">:</th>
                      <td>{{ data.Organization?.expired_date }}</td>
                    </tr>
                    <tr>
                      <th class="view_t_head">Owner Name</th>
                      <th style="text-align: center;">:</th>
                      <td>{{ data.Organization?.owner_name }}</td>
                    </tr>
                    <tr>
                      <th class="view_t_head">Mobile</th>
                      <th style="text-align: center;">:</th>
                      <td>{{ data.Organization?.mobile }}</td>
                    </tr>
                    <tr>
                      <th class="view_t_head">Address</th>
                      <th style="text-align: center;">:</th>
                      <td>{{ data.Organization?.address }}</td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </fieldset>
          </div>
          <div class="col-md-12">
            <fieldset>
              <span class="legend">Package Information</span>
              <div class="table-responsive">
                <table class="table table-striped">
                  <tbody>
                    <tr>
                      <th class="view_t_head">Start Date</th>
                      <th style="text-align: center; width:2%">:</th>
                      <td>{{ data.Organization?.package?.start_date }}</td>
                    </tr>
                    <tr>
                      <th class="view_t_head">Packate</th>
                      <th style="text-align: center; width:2%">:</th>
                      <td>{{ data.Organization?.package?.title }}</td>
                    </tr>
                    <tr>
                      <th class="view_t_head">Registration Fee</th>
                      <th style="text-align: center;">:</th>
                      <td>{{ data.Organization?.package?.registration_fee }}</td>
                    </tr>
                    <tr>
                      <th class="view_t_head">Fee Month</th>
                      <th style="text-align: center;">:</th>
                      <td>{{ data.Organization?.package?.free_month }}</td>
                    </tr>
                    <tr>
                      <th class="view_t_head">Monthly Fee</th>
                      <th style="text-align: center;">:</th>
                      <td>{{ data.Organization?.package?.price }}</td>
                    </tr>
                    <tr>
                      <th class="view_t_head">Yearly Fee</th>
                      <th style="text-align: center;">:</th>
                      <td>{{ data.Organization?.package?.yearly_price }}</td>
                    </tr>
                  </tbody>

                </table>
              </div>
            </fieldset>
          </div>
        </div>

      </div>
      <div class="col-md-12">
        <fieldset>
          <span class="legend">Invoice Details</span>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>SL</th>
                  <th>Account Head</th>
                  <th>Amount</th>
                  <th>Status</th>
                  <th>Created At</th>
                  <th>Updated At</th>

                </tr>
              </thead>
              <tbody>
                <template v-if="data.invoice_details">
                  <tr v-for="(invoiced, index) in data.invoice_details" :key="index">
                    <td>{{ index + 1 }}</td>
                    <td>{{ invoiced.accounthead?.title }}</td>
                    <td>{{ invoiced.amount }}</td>
                    <td>{{ invoiced.status }}</td>
                    <td>{{ invoiced.created_at }}</td>
                    <td>{{ invoiced.updated_at }}</td>
                  </tr>
                </template>
              </tbody>
            </table>
          </div>
        </fieldset>

      </div>
      <div class="col-md-12 text-center" v-if="data.payment_status == 'unpaid'">
        <button class="btn btn-lg btn-primary" @click="paynow">Pay Now</button>
      </div>
    </div>
  </view-page>
</template>

<script>
import axios from 'axios';


const model = "invoice";

export default {
  data() {
    return {
      page_title: "",
      model: model,
      data: {

      },
      fileColumns: [],
    };
  },
  methods: {
    getAccountHeadTitle(id) {
      const list = this.$root?.global?.account_heads || [];
      const accountHead = list.find(head => head.id === id);
      return accountHead ? accountHead.title : 'N/A';
    },
    async paynow() {
      if (!this.data.id) {
        this.$toast('Invoice ID not found', 'warning');
        return;
      }

      try {
        const response = await axios.get(`/paynow/${this.data.id}`);

        if (response.data.success) {
          this.get_data(`${this.model}/${this.$route.params.id}`);
          this.$toast(response.data.message, 'success');
        } else {
          this.$toast(response.data.message || 'Payment failed', 'error');
        }

      } catch (error) {
        console.error(error);
        const msg = error.response?.data?.message || 'Error processing payment';
        this.$toast(msg, 'error');
      }
    }
  },
  created() {
    this.page_title = `${this.headline(this.model)} View`;
    this.get_data(`${this.model}/${this.$route.params.id}`);
    this.account_heads = this.$root?.global?.account_heads || [];
  },
};
</script>