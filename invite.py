#!/usr/bin/env python

import smtplib

from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart

sender = 'jayekub@gmail.com'
recipients = ['jacobk@pixar.com', 'joycemujeh@gmail.com']

message = MIMEMultipart('alternative')
message['From'] = sender
message['To'] = ','.join(recipients)
message['Subject'] = "You're Invited to Jacob's Roaring 40th!"

message.attach(MIMEText(open('invite.txt', 'r').read(), 'plain'))
message.attach(MIMEText(open('invite.html', 'r').read(), 'html'))

with smtplib.SMTP_SSL('smtp.gmail.com', 465) as smtp_server:
    smtp_server.login(sender, 'eqpk injg zaeq ylpu')
    smtp_server.sendmail(sender, recipients, message.as_string())
