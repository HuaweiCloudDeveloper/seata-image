<p align="center">
  <h1 align="center">Seata Distributed Transaction</h1>
  <p align="center">
    <a href="README.md"><strong>English</strong></a> | <strong>简体中文</strong>
  </p>
</p>

## Table of Contents

- [Repository Introduction](#repository-introduction)
- [Prerequisites](#prerequisites)
- [Image Specifications](#image-specifications)
- [Getting Help](#getting-help)
- [How to Contribute](#how-to-contribute)

## Repository Introduction
[Seata](https://github.com/apache/incubator-seata) **Seata** is an open-source distributed transaction solution that delivers high performance and user-friendly **AT, TCC, SAGA, and XA** transaction modes to ensure data consistency in microservices architectures.

**Core Features of Seata**:

1. **Multi-Transaction Mode Support**
    - **AT (Auto-Compensation)**: Based on local transactions + global locks, offering high performance and low intrusion, suitable for most scenarios.
    - **TCC (Try-Confirm-Cancel)**: Implements two-phase commit through business coding, ideal for high-consistency requirements.
    - **SAGA**: A long-transaction solution that orchestrates services via state machines, supporting eventual consistency.
    - **XA**: Based on the XA protocol, ensuring strong consistency but with lower performance.

2. **Global Transaction Management**
    - Coordinates distributed transactions through **TC (Transaction Coordinator)**, managing branch transaction commits/rollbacks uniformly.

3. **High Availability & Scalability**
    - Supports cluster deployment, with TC registrable to Nacos, Eureka, and other service discovery platforms.
    - Storage modes include DB, Redis, etc., adapting flexibly to diverse scenarios.

4. **Low Intrusiveness**
    - Minimal code intrusion via proxied data sources (AT mode) or annotations (TCC/SAGA).

5. **Strong Consistency Guarantee**
    - Global lock mechanism prevents dirty writes, while AT mode auto-generates reverse SQL for data compensation, ensuring atomicity.

6. **Ecosystem Compatibility**
    - Compatible with Dubbo, Spring Cloud, gRPC, and other microservices frameworks, supporting MySQL, Oracle, PostgreSQL, and other mainstream databases.

**Summary**: Seata, with its flexible transaction modes, highly available architecture, and low-intrusion design, is a core tool for resolving distributed transaction challenges.

This project provides an open-source image product [**`Seata Monitoring and Alerting Tool`**](https://marketplace.huaweicloud.com/hidden/contents/9e9217e1-5c9d-4026-96bd-b3395d0c9aa8#productid=OFFI1131118959554052096), pre-installed with Seata software and its runtime environment, along with deployment templates. Follow the quick start guide for an "out-of-the-box" experience.

**Architecture Design:**

![](./img.png)

> **System Requirements:**
> - CPU: 2vCPUs or higher
> - RAM: 4GB or more
> - Disk: At least 50GB

## Prerequisites
[Register a Huawei Account and Activate Huawei Cloud](https://support.huaweicloud.com/usermanual-account/account_id_001.html)

## Image Specifications

| Image Specification                                                                                                                                              | Features | Notes |
|---------------------------------------------------------------------------------------------------------------------------------------------------| --- | --- |
| [Seata2.3.0-arm-v1.0](https://marketplace.huaweicloud.com/hidden/contents/9e9217e1-5c9d-4026-96bd-b3395d0c9aa8#productid=OFFI1131118959554052096) | Deployed on Kunpeng servers + Huawei Cloud EulerOS 2.0 64bit |  |

## Getting Help
- For additional questions, submit an [issue](https://github.com/HuaweiCloudDeveloper/seata-image/issues) or contact Huawei Cloud Marketplace support for the specified product.
- Explore other open-source images at [open-source-image-repos](https://github.com/HuaweiCloudDeveloper/open-source-image-repos).

## How to Contribute
- Fork this repository and submit a pull request.
- Update README.md with your open-source image information.