from hfukuda/madgraph:latest

WORKDIR /home/hep/MG5_aMC_v2_6_3_2
RUN cd $WORKDIR

RUN echo "install maddm" >> script.txt && ./bin/mg5_aMC -f script.txt

CMD ./bin/maddm.py