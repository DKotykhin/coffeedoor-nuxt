import { z } from 'zod';

export const email = z.string().trim().email({ message: 'Invalid email format' });

export const password = z
    .string()
    .trim()
    .min(8, { message: 'Minimum 8 characters to fill' })
    .max(128, { message: 'Too long password!' })
    .regex(/[A-Z]/, { message: 'At least 1 character should be an uppercase letter!' })
    .regex(/[0-9]/, { message: 'At least 1 character should be a digit!' });

export const textFieldRequired = z
    .string()
    .trim()
    .min(2, { message: 'Minimum 2 characters to fill' })
    .max(50, { message: 'Maximum 50 characters to fill' });

export const textFieldOptional = z
    .string()
    .trim()
    .max(50, { message: 'Maximum 50 characters to fill' });

const phoneRegex = new RegExp(/^([+]?[\s0-9]+)?(\d{3}|[(]?[0-9]+[)])?([-]?[\s]?[0-9])+$/);
export const phone = z
    .string()
    .trim()
    .regex(phoneRegex, 'Invalid phone number!')
    .min(10, { message: 'Invalid phone number!' })
    .max(13, { message: 'Invalid phone number!' });

export const areaTextField = z
    .string()
    .trim()
    .max(250, { message: 'Maximum 250 characters to fill' });

export const price = z
    .string()
    .trim()
    .min(1, { message: 'Minimum 1 characters to fill' })
    .max(12, { message: 'Maximum 12 characters to fill' });
