// Morris.js Charts sample data for SB Admin template

$(function() {

    Morris.Line({
      element: 'transactions_chart',
      data: [{"created_at":"2015-01-11","amount":8700012}, {"created_at":"2015-01-10","amount":3000000}],
      xkey: 'created_at',
      ykeys: ['amount'],
      labels: ['amount']
    });
});
