class SubscriptionPlanModel {
  String title;
  String planDescription;
  double amount;

  SubscriptionPlanModel({this.title, this.amount, this.planDescription});
}

List<SubscriptionPlanModel> plans = [
  SubscriptionPlanModel(
      title: 'Premium',
      amount: 50.0,
      planDescription: 'Stream in Ultra HD. Watch on 4 devices'),
  SubscriptionPlanModel(
      title: 'Standard',
      amount: 30.0,
      planDescription: 'Stream in High Definition. Watch on 2 devices'),
  SubscriptionPlanModel(
      title: 'Basic',
      amount: 20.0,
      planDescription: 'Stream in Standard Definition. Watch on 1 devices'),
];
