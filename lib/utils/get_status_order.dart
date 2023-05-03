String getStatusOrder(String status) {
  switch (status) {
    case "0":
      return 'Pending';
    case "1":
      return 'Confirmed';
    case "2":
      return 'Shipping';
    case "3":
      return 'Delivered';
    case "4":
      return 'Rating';
    case "5":
      return 'Cancelled';
    case "6":
      return 'Return';
    default:
      return 'Unknown';
  }
}
