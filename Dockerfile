FROM swipl:latest
WORKDIR /app
COPY . .
EXPOSE 10000
CMD ["swipl", "solver.pl"]
