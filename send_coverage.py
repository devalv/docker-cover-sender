import asyncio
import os

from aio_send_dir import send_dir


asyncio.run(
    send_dir(
        dir_path="coverage",
        smtp_hostname=os.environ["SMTP_SERVER"],
        smtp_port=int(os.environ.get("SMTP_PORT", "25")),
        from_email=os.environ["SMTP_USER"],
        recipient_emails=os.environ["COVERAGE_EMAIL"].split(","),
        sender_alias="Coverage Report",
    )
)
