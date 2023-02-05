class SMSResponse {
  final int responseCode;
  final int messageId;
  final String successMessage;
  final String errorMessage;

  SMSResponse({required this.responseCode, required this.messageId, required this.successMessage, required this.errorMessage});

  factory SMSResponse.fromJson(Map<String, dynamic> json) {
    return SMSResponse(
      responseCode: json['response_code'],
      messageId: json['message_id'],
      successMessage: json['success_message'],
      errorMessage: json['error_message'],
    );
  }
}
