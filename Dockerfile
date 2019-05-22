FROM continuumio/miniconda3

RUN conda create -n LTR_retriever
RUN conda install -c conda-forge perl perl-text-soundex
RUN conda install -c bioconda cd-hit repeatmasker
RUN git clone https://github.com/oushujun/LTR_retriever.git
RUN echo "source activate LTR_retriever" > ~/.bashrc
ENV PATH /opt/conda/envs/env/bin:$PATH

RUN cp /opt/miniconda3/envs/LTR_retriever/share/RepeatMasker/Libraries/taxonomy.dat.gz ./
RUN gunzip taxonomy.dat.gz
RUN taxonomy.dat /opt/miniconda3/envs/LTR_retriever/share/RepeatMasker/Libraries/

#RUN cp LTR_retriever/LTR_retriever /usr/bin

ENTRYPOINT [ "/LTR_retriever/LTR_retriever" ]
