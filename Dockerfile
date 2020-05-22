FROM heroku/heroku:20
RUN curl -sSL https://github.com/jpillora/chisel/releases/download/v1.5.2/chisel_1.5.2_linux_amd64.gz | zcat > /bin/chisel
RUN chmod +x /bin/chisel
RUN useradd -m heroku
USER heroku
EXPOSE 5000
EXPOSE 1080
EXPOSE 1081
EXPOSE 1082
CMD chisel server --auth $CHISEL_AUTH --key $CHISEL_KEY --reverse --proxy "https://www.heroku.com" --pid -v 
