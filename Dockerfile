# Ultroid - UserBot
# Copyright (C) 2021 TeamUltroid
# This file is a part of < https://github.com/thewhiteharlot/RokanBot2 >
# PLease read the GNU Affero General Public License in <https://github.com/thewhiteharlot/RokanBot2blob/main/LICENSE/>.

FROM programmingerror/ultroid:b0.1

# set timezone
ENV TZ=Asia/Kolkata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# clone the repo and change workdir
COPY . .
RUN sh run.sh
WORKDIR /root/RokanBot/

# install main requirements.
RUN pip3 install --no-cache-dir -r requirements.txt

# install addons requirements
RUN wget https://git.io/JWdOk -O addons.txt
RUN pip3 install --no-cache-dir -r addons.txt

# remove wheel coz of warning
RUN rm -rf /usr/local/lib/python3.9/site-packages/.wh
