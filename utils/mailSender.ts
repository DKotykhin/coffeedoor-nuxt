import { Resend } from 'resend';

import { ApiError } from '@/handlers/apiError';

const resend = new Resend(process.env.RESEND_API_KEY!);

export const mailSender = async ({
    to,
    subject,
    html,
}: {
    to: string;
    subject: string;
    html: string;
}) => {
    const { data, error } = await resend.emails.send({
        from: `No-reply service <${process.env.RESEND_EMAIL_ADDRESS}>`,
        to,
        subject,
        html,
    });
    if (error) throw ApiError.internalError(error.message || "Can't send email");
    return data;
};
