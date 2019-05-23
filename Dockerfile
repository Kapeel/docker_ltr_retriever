FROM continuumio/miniconda3

RUN conda create -n LTR_retriever
RUN conda install -c conda-forge perl perl-text-soundex
RUN conda install -c bioconda cd-hit
RUN conda install -c bioconda/label/cf201901 repeatmasker
RUN git clone https://github.com/oushujun/LTR_retriever.git
RUN echo "source activate LTR_retriever" > ~/.bashrc
ENV PATH /opt/conda/envs/env/bin:$PATH

ENTRYPOINT [ "/LTR_retriever/LTR_retriever" ]
