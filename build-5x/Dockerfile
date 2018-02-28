FROM dockerregistry.westermo.com:443/weos-toolchain

# Add current toolchains to PATH
ENV PATH="${PATH}:/usr/local/arm-unknown-linux-gnueabi-5.3-1/bin"
ENV PATH="${PATH}:/usr/local/powerpc-unknown-linux-gnu-5.3-1/bin"
ENV PATH="${PATH}:/usr/local/x86_64-unknown-linux-gnu-5.3-1/bin"

# Disable sudo's secure_path so that we can invoke gcc directly if
# required.
RUN sed -i 's/^.*secure_path=.*$//' /etc/sudoers

# Setup the custom initalization that sets up the bob user.
COPY weinit /sbin/weinit
ENTRYPOINT ["/sbin/weinit"]
