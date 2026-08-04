<template>
    <view-page>
        <div class="container my-5">
            <div class="invoice-wrapper bg-white p-4 shadow-sm mx-auto rounded-3" id="my_print">
                <!-- Header -->
                <div
                    class="invoice-header d-flex flex-wrap justify-content-between align-items-center border-bottom pb-3 mb-4 text-center text-md-start">
                    <div class="logo-section flex-fill mb-3 mb-md-0 text-md-start order-1">
                        <img :src="$root.site.logo_two" alt="Logo" class="img-fluid" style="max-height:60px;">
                    </div>
                    <div class="title-section flex-fill mb-3 mb-md-0 text-center order-2">
                        <h3 class="fw-bold text-uppercase m-0">INVOICE</h3>
                    </div>
                    <div class="info-section flex-fill text-md-end small order-3">
                        <h5 class="mb-1 fw-bold">BD Organization</h5>
                        <p class="mb-0">Mobile: {{ $root.site.mobile1 }}</p>
                        <p class="mb-0">Email: {{ $root.site.contact_email }}</p>
                    </div>
                </div>

                <!-- Invoice Info -->
                <div class="row mb-3">
                    <div class="col-6">
                        <p class="mb-1"><strong>Date:</strong> {{ data.invoice_date }}</p>
                    </div>
                    <div class="col-6">
                        <p class="mb-0 text-end"><strong>Invoice #:</strong> {{ data.invoice_no }}</p>
                    </div>
                </div>

                <!-- From / To (fixed layout) -->
                <div class="d-flex justify-content-between flex-wrap border rounded p-3 mb-4">
                    <div class="from-section" style="flex:1; width:240px;">
                        <h6 class="fw-bold mb-1">From:</h6>
                        <p class="mb-0">{{ $root.site.title }}</p>
                        <p class="mb-0">{{ $root.site.address }}</p>
                        <p class="mb-0">Email: {{ $root.site.contact_email }}</p>
                    </div>
                    <div class="to-section  mt-3 mt-md-0" style="flex:1; width:240px;">
                        <div class="to-section">
                            <h6 class="fw-bold mb-1">To:</h6>
                            <p class="mb-0">{{ data.Organization?.owner_name }}</p>
                            <p class="mb-0">{{ data.Organization?.mobile }}</p>
                            <p class="mb-0">{{ data.Organization?.address }}</p>
                            <p class="mb-0">Email: {{ data.Organization?.email }}</p>
                        </div>
                    </div>
                </div>

                <!-- Invoice Table -->
                <div class="table-responsive">
                    <table class="table table-bordered table-bill align-middle mb-3">
                        <thead class="table-light">
                            <tr>
                                <th style="width: 50px;">#</th>
                                <th>Description</th>
                                <th class="text-end">Amount</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(acd, index) in data.invoice_details" :key="index">
                                <td>{{ index + 1 }}</td>
                                <td>{{ acd.accounthead?.title }}</td>
                                <td class="text-end">{{ acd.amount }}</td>
                            </tr>
                        </tbody>
                        <tfoot>
                            <tr class="fw-bold">
                                <td colspan="2" class="text-end">Total</td>
                                <td class="text-end">{{ totalAmount.toFixed(2) }}</td>
                            </tr>
                        </tfoot>
                    </table>
                </div>

                <!-- In Words -->
                <p class="mt-3 mb-1"><strong>In Words:</strong> {{ currencyToWordsBD(data.amount) }}</p>

                <!-- Footer -->
                <p class="small text-muted mt-3">{{ $root.global.invoice_footer_text }}</p>

                <!-- Pay Now Button -->
                <div class="text-center mt-4" v-if="data.payment == 'No'">
                    <button type="button" class="btn btn-info btn-lg" @click="paynow">
                        Pay Now
                    </button>
                </div>
            </div>
        </div>
    </view-page>
</template>

<script>
const model = "invoice";

export default {
    data() {
        return {
            page_title: "Invoice",
            model,
            data: {},
            print_area: "my_print",
        };
    },
    computed: {
        totalAmount() {
            if (!this.data.invoice_details) return 0;
            return this.data.invoice_details.reduce((sum, acd) => sum + parseFloat(acd.amount || 0), 0);
        },
    },
    created() {
        this.page_title = "Invoice";
        this.get_data(`${this.model}/bill/${this.$route.params.id}`);
    },
    methods: {
        async paynow() {
            if (!this.data.id) {
                this.$toast("Invoice ID not found", "warning");
                return;
            }
            try {
                const response = await axios.get(`/paynow/${this.data.id}`);
                if (response.data.success) {
                    this.get_data(`${this.model}/bill/${this.$route.params.id}`);
                    this.$toast(response.data.message, "success");
                } else {
                    this.$toast(response.data.message || "Payment failed", "error");
                }
            } catch (error) {
                const msg = error.response?.data?.message || "Error processing payment";
                this.$toast(msg, "error");
            }
        },
    },
};
</script>

<style scoped>
.invoice-wrapper {
    max-width: 560px;
}

.to-section {
    width: 180px;
    float: right
}

.table-bill th {
    background-color: #2c3d70;
    color: #fff;
}

@media (max-width: 576px) {
    .invoice-header {
        text-align: center !important;
        flex-direction: column;
    }

    .invoice-header .logo-section,
    .invoice-header .title-section,
    .invoice-header .info-section {
        flex: 100%;
        text-align: center !important;
    }

    .invoice-header .info-section {
        margin-top: 10px;
    }

    .to-section {
        float: left
    }
}

@media print {
    .table-bill th {
        background-color: #2c3d70 !important;
        color: #fff;
    }
}
</style>
