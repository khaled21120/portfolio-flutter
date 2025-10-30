import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/extentions/extentions.dart';
import '../../../core/constants/text_styles.dart';
import '../cubit/contact_cubit.dart';
import '../cubit/contact_state.dart';
import '../models/contact_input_model.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ContactCubit>();

    return BlocConsumer<ContactCubit, ContactState>(
      listener: (context, state) {
        state.whenOrNull(
          sent: () {
            context.showSnackBar('✅ Message sent successfully', isError: false);
            cubit.clear();
          },
          error: (message) {
            context.showSnackBar(message);
          },
        );
      },
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

        return Container(
          width: context.isMobile ? context.width * .9 : context.width * .5,
          padding: EdgeInsets.all(30.w),
          margin: EdgeInsets.symmetric(horizontal: 30.w),
          decoration: BoxDecoration(
            color: context.colorScheme.surface.withValues(alpha: .9),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: context.colorScheme.primary.withValues(alpha: .5),
              width: 1.5.w,
            ),
            boxShadow: [
              BoxShadow(
                color: context.colorScheme.primary.withValues(alpha: .1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Form(
            key: cubit.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Send me a message',
                  style: AppTextStyles.headingLarge(context),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Have a project in mind? Let\'s discuss how we can work together.',
                  style: AppTextStyles.body(context).copyWith(height: 1.5),
                ),
                20.height,
                _buildTextField(
                  label: 'Full Name',
                  icon: FontAwesomeIcons.user,
                  controller: cubit.nameController,
                  validator: (v) =>
                      v.isNullOrEmpty ? 'Please enter your name' : null,
                ),
                15.height,
                _buildTextField(
                  label: 'Email',
                  icon: FontAwesomeIcons.envelope,
                  controller: cubit.emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (v) {
                    if (v.isNullOrEmpty) return 'Please enter your email';
                    if (!v.isEmail) return 'Enter a valid email address';
                    return null;
                  },
                ),
                15.height,
                _buildTextField(
                  label: 'Message',
                  icon: FontAwesomeIcons.commentDots,
                  controller: cubit.messageController,
                  maxLines: 5,
                  validator: (v) =>
                      v.isNullOrEmpty ? 'Please enter your message' : null,
                ),
                25.height,
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : _buildSubmitButton(context, isLoading),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField({
    required String label,
    required IconData icon,
    required TextEditingController controller,
    FormFieldValidator<String>? validator,
    TextInputType? keyboardType,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      maxLines: maxLines,
      keyboardType: keyboardType,
      style: AppTextStyles.body(
        context,
      ).copyWith(color: context.colorScheme.onSurface),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: context.colorScheme.onSurfaceVariant),
        prefixIcon: Icon(icon, size: 20.sp, color: context.colorScheme.primary),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: context.colorScheme.outline.withValues(alpha: 0.3),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: context.colorScheme.outline.withValues(alpha: 0.3),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: context.colorScheme.primary,
            width: 2.w,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: context.colorScheme.error, width: 2.w),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: context.colorScheme.error, width: 2.w),
        ),
        filled: true,
        fillColor: context.colorScheme.primary.withValues(alpha: 0.2),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: maxLines > 1 ? 16.h : 0,
        ),
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context, bool isLoading) {
    final cubit = context.read<ContactCubit>();

    return SizedBox(
      width: double.infinity,
      height: 66.h,
      child: Material(
        color: context.colorScheme.primary,
        borderRadius: BorderRadius.circular(12.r),
        child: InkWell(
          onTap: isLoading
              ? null
              : () {
                  if (cubit.formKey.currentState?.validate() ?? false) {
                    cubit.submit(
                      ContactInputModel(
                        name: cubit.nameController.text.trim(),
                        email: cubit.emailController.text.trim(),
                        message: cubit.messageController.text.trim(),
                      ),
                    );
                  }
                },
          borderRadius: BorderRadius.circular(12.r),
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedOpacity(
                opacity: isLoading ? 0 : 1,
                duration: const Duration(milliseconds: 200),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.paperPlane,
                      size: 18.sp,
                      color: Colors.white,
                    ),
                    12.width,
                    Text(
                      'Send Message',
                      style: AppTextStyles.headingSmall(context).copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              if (isLoading)
                SizedBox(
                  width: 20.w,
                  height: 20.h,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: context.colorScheme.onPrimary,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
