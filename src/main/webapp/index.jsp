<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VARMA · DevOps & Springboot</title>
    <!-- Font Awesome 6 (free) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', system-ui, -apple-system, 'Segoe UI', Roboto, sans-serif;
            background: #0b0e14;
            color: #e9edf5;
            line-height: 1.6;
            scroll-behavior: smooth;
        }

        /* modern glassmorphism + gradient accents */
        .container {
            max-width: 1300px;
            margin: 0 auto;
            padding: 0 2rem;
        }

        /* ----- HEADER / HERO ----- */
        .hero {
            background: radial-gradient(circle at 20% 30%, #1a2639, #0b0e14 80%);
            padding: 4rem 0 5rem;
            border-bottom: 1px solid rgba(56, 189, 248, 0.15);
            position: relative;
            overflow: hidden;
        }

        .hero::after {
            content: '';
            position: absolute;
            top: -40%;
            right: -10%;
            width: 500px;
            height: 500px;
            background: radial-gradient(circle, rgba(56, 189, 248, 0.08) 0%, transparent 70%);
            border-radius: 50%;
            pointer-events: none;
        }

        .hero-content {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            justify-content: space-between;
            position: relative;
            z-index: 2;
        }

        .hero-text h1 {
            font-size: 4rem;
            font-weight: 700;
            letter-spacing: -0.02em;
            background: linear-gradient(135deg, #f0f9ff 0%, #7dd3fc 80%);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            margin-bottom: 0.5rem;
        }

        .hero-text .highlight {
            color: #38bdf8;
            background: none;
            -webkit-background-clip: unset;
            background-clip: unset;
        }

        .hero-text p {
            font-size: 1.3rem;
            color: #b9c7e0;
            max-width: 550px;
            margin-top: 0.5rem;
            border-left: 4px solid #38bdf8;
            padding-left: 1.2rem;
        }

        .hero-badge {
            display: inline-block;
            background: rgba(56, 189, 248, 0.12);
            backdrop-filter: blur(4px);
            padding: 0.5rem 1.8rem;
            border-radius: 40px;
            border: 1px solid rgba(56, 189, 248, 0.25);
            color: #94d0ff;
            font-weight: 500;
            margin-top: 1.5rem;
            font-size: 0.95rem;
            letter-spacing: 0.3px;
        }

        .hero-badge i {
            margin-right: 8px;
            color: #38bdf8;
        }

        .hero-image {
            background: rgba(255, 255, 255, 0.02);
            backdrop-filter: blur(2px);
            padding: 1.2rem 2rem;
            border-radius: 60px 20px 60px 20px;
            border: 1px solid rgba(56, 189, 248, 0.2);
            box-shadow: 0 20px 40px -20px rgba(0, 0, 0, 0.8);
        }

        .hero-image i {
            font-size: 4.5rem;
            color: #38bdf8;
            filter: drop-shadow(0 0 12px rgba(56, 189, 248, 0.3));
        }

        /* navigation */
        .nav-links {
            display: flex;
            gap: 2.5rem;
            margin-top: 2.5rem;
            flex-wrap: wrap;
        }

        .nav-links a {
            color: #b9c7e0;
            text-decoration: none;
            font-weight: 500;
            font-size: 1.05rem;
            letter-spacing: 0.3px;
            transition: all 0.2s;
            border-bottom: 2px solid transparent;
            padding-bottom: 4px;
        }

        .nav-links a:hover {
            color: #ffffff;
            border-bottom-color: #38bdf8;
        }

        /* ----- section general ----- */
        section {
            padding: 5rem 0;
        }

        .section-title {
            font-size: 2.6rem;
            font-weight: 600;
            letter-spacing: -0.02em;
            margin-bottom: 2.5rem;
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .section-title i {
            color: #38bdf8;
            font-size: 2.2rem;
        }

        .section-title::after {
            content: '';
            flex: 1;
            height: 2px;
            background: linear-gradient(90deg, rgba(56, 189, 248, 0.3), transparent);
            margin-left: 1rem;
        }

        /* ----- about ----- */
        .about-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 3rem;
            align-items: center;
        }

        .about-text {
            font-size: 1.15rem;
            color: #ccd9f0;
            background: rgba(255, 255, 255, 0.02);
            padding: 2rem;
            border-radius: 24px;
            border: 1px solid rgba(255, 255, 255, 0.04);
            backdrop-filter: blur(4px);
        }

        .about-text p {
            margin-bottom: 1rem;
        }

        .about-stats {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1.5rem;
        }

        .stat-card {
            background: rgba(255, 255, 255, 0.03);
            border-radius: 20px;
            padding: 1.8rem 1.5rem;
            border: 1px solid rgba(255, 255, 255, 0.05);
            text-align: center;
            transition: transform 0.25s ease, border-color 0.2s;
        }

        .stat-card:hover {
            transform: translateY(-5px);
            border-color: rgba(56, 189, 248, 0.3);
        }

        .stat-card .number {
            font-size: 2.5rem;
            font-weight: 700;
            color: #38bdf8;
        }

        .stat-card .label {
            color: #8899bb;
            font-size: 0.95rem;
            margin-top: 0.3rem;
        }

        /* ----- skills (modern chips) ----- */
        .skills-cloud {
            display: flex;
            flex-wrap: wrap;
            gap: 1rem 1.2rem;
            justify-content: center;
            padding: 2rem 0;
        }

        .skill-chip {
            background: rgba(56, 189, 248, 0.06);
            backdrop-filter: blur(4px);
            border: 1px solid rgba(56, 189, 248, 0.15);
            padding: 0.8rem 2rem;
            border-radius: 60px;
            font-weight: 500;
            color: #d6e4ff;
            font-size: 1.05rem;
            transition: all 0.25s;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }

        .skill-chip i {
            color: #38bdf8;
            font-size: 1.2rem;
        }

        .skill-chip:hover {
            background: rgba(56, 189, 248, 0.14);
            border-color: #38bdf8;
            transform: scale(1.02);
            box-shadow: 0 8px 20px rgba(56, 189, 248, 0.15);
        }

        /* ----- projects (cards) ----- */
        .project-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-top: 1rem;
        }

        .project-card {
            background: rgba(255, 255, 255, 0.02);
            backdrop-filter: blur(4px);
            border-radius: 28px;
            padding: 2rem 1.8rem;
            border: 1px solid rgba(255, 255, 255, 0.04);
            transition: all 0.3s ease;
            box-shadow: 0 10px 20px -12px rgba(0, 0, 0, 0.6);
        }

        .project-card:hover {
            transform: translateY(-8px);
            border-color: rgba(56, 189, 248, 0.3);
            background: rgba(255, 255, 255, 0.04);
            box-shadow: 0 25px 35px -16px rgba(0, 0, 0, 0.8);
        }

        .project-card .icon {
            font-size: 2.2rem;
            color: #38bdf8;
            margin-bottom: 0.8rem;
        }

        .project-card h3 {
            font-size: 1.6rem;
            font-weight: 600;
            margin-bottom: 0.7rem;
            color: #f0f5ff;
        }

        .project-card p {
            color: #b0c3df;
            margin-bottom: 1.2rem;
        }

        .project-tag {
            display: inline-block;
            background: rgba(56, 189, 248, 0.1);
            padding: 0.2rem 1.2rem;
            border-radius: 30px;
            font-size: 0.8rem;
            font-weight: 500;
            color: #8bcbff;
            letter-spacing: 0.3px;
            border: 1px solid rgba(56, 189, 248, 0.1);
        }

        /* ----- contact (glass form) ----- */
        .contact-wrapper {
            display: grid;
            grid-template-columns: 1fr 1.2fr;
            gap: 3rem;
            align-items: start;
        }

        .contact-info {
            background: rgba(255, 255, 255, 0.02);
            backdrop-filter: blur(4px);
            border-radius: 32px;
            padding: 2.5rem;
            border: 1px solid rgba(255, 255, 255, 0.04);
        }

        .contact-info h4 {
            font-size: 1.8rem;
            font-weight: 500;
            margin-bottom: 1.5rem;
        }

        .contact-info i {
            color: #38bdf8;
            width: 2rem;
        }

        .contact-info p {
            margin: 1rem 0;
            color: #b9cae5;
        }

        .contact-form {
            background: rgba(255, 255, 255, 0.02);
            backdrop-filter: blur(4px);
            border-radius: 32px;
            padding: 2.5rem;
            border: 1px solid rgba(255, 255, 255, 0.04);
        }

        .contact-form input,
        .contact-form textarea {
            width: 100%;
            padding: 1rem 1.2rem;
            margin-bottom: 1.2rem;
            background: rgba(0, 0, 0, 0.3);
            border: 1px solid rgba(255, 255, 255, 0.06);
            border-radius: 60px;
            color: #e9edf5;
            font-size: 1rem;
            transition: border 0.2s, box-shadow 0.2s;
            outline: none;
        }

        .contact-form textarea {
            border-radius: 28px;
            resize: vertical;
            min-height: 120px;
        }

        .contact-form input:focus,
        .contact-form textarea:focus {
            border-color: #38bdf8;
            box-shadow: 0 0 0 4px rgba(56, 189, 248, 0.08);
        }

        .contact-form button {
            background: linear-gradient(135deg, #1f8cdb, #0f6bb3);
            border: none;
            padding: 1rem 2.5rem;
            border-radius: 60px;
            font-weight: 600;
            color: white;
            font-size: 1.1rem;
            cursor: pointer;
            transition: all 0.2s;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            letter-spacing: 0.5px;
            border: 1px solid rgba(56, 189, 248, 0.2);
        }

        .contact-form button:hover {
            background: linear-gradient(135deg, #38bdf8, #1a7fc9);
            transform: scale(1.01);
            box-shadow: 0 12px 28px -8px rgba(56, 189, 248, 0.3);
        }

        /* footer */
        .footer {
            border-top: 1px solid rgba(255, 255, 255, 0.04);
            padding: 2.5rem 0;
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 1.5rem;
            color: #8899bb;
        }

        .footer a {
            color: #7ea6d9;
            text-decoration: none;
            transition: color 0.2s;
        }

        .footer a:hover {
            color: #38bdf8;
        }

        .footer-socials a {
            margin-left: 1.5rem;
            font-size: 1.4rem;
        }

        /* responsive */
        @media (max-width: 900px) {
            .hero-content {
                flex-direction: column;
                align-items: flex-start;
                gap: 2rem;
            }
            .about-grid,
            .contact-wrapper {
                grid-template-columns: 1fr;
            }
            .hero-text h1 {
                font-size: 3rem;
            }
            .section-title {
                font-size: 2rem;
            }
            .about-stats {
                grid-template-columns: 1fr 1fr;
            }
        }

        @media (max-width: 500px) {
            .hero-text h1 {
                font-size: 2.3rem;
            }
            .nav-links {
                gap: 1.2rem;
            }
            .stat-card .number {
                font-size: 2rem;
            }
        }

        /* scrollbar */
        ::-webkit-scrollbar {
            width: 6px;
        }
        ::-webkit-scrollbar-track {
            background: #0b0e14;
        }
        ::-webkit-scrollbar-thumb {
            background: #1f3a5a;
            border-radius: 20px;
        }
        ::-webkit-scrollbar-thumb:hover {
            background: #2b5780;
        }

        /* extra glow */
        .glow-text {
            text-shadow: 0 0 40px rgba(56, 189, 248, 0.1);
        }
    </style>
</head>
<body>

    <header class="hero">
        <div class="container hero-content">
            <div class="hero-text">
                <h1>VARMA <span class="highlight">·</span> DevOps</h1>
                <p>Springboot · automation · scalable infrastructure</p>
                <div class="hero-badge">
                    <i class="fas fa-rocket"></i> CI/CD · K8s · AWS · Terraform
                </div>
                <div class="nav-links">
                    <a href="#about"><i class="fas fa-user-astronaut"></i> About</a>
                    <a href="#skills"><i class="fas fa-code"></i> Skills</a>
                    <a href="#projects"><i class="fas fa-folder-open"></i> Projects</a>
                    <a href="#contact"><i class="fas fa-paper-plane"></i> Contact</a>
                </div>
            </div>
            <div class="hero-image">
                <i class="fas fa-cloud-upload-alt"></i>
                <i class="fas fa-dharmachakra" style="margin-left: 1rem; opacity: 0.7;"></i>
                <i class="fas fa-terminal" style="margin-left: 1rem; opacity: 0.6;"></i>
            </div>
        </div>
    </header>

    <main class="container">

        <!-- ABOUT -->
        <section id="about">
            <div class="section-title">
                <i class="fas fa-user-astronaut"></i> About Me
            </div>
            <div class="about-grid">
                <div class="about-text">
                    <p><i class="fas fa-quote-left" style="color: #38bdf8; opacity: 0.5; margin-right: 6px;"></i> 
                        DevOps engineer with a passion for bridging development and operations. 
                        I design resilient, automated pipelines and cloud-native architectures.
                    </p>
                    <p>From CI/CD with Jenkins & GitHub Actions to Kubernetes orchestration and infrastructure as code (Terraform), 
                    I bring a developer-first mindset to every project. I thrive on reducing toil and increasing delivery velocity.</p>
                    <p style="margin-top: 1.2rem;"><i class="fas fa-map-pin" style="color: #38bdf8;"></i>  Hyderabad, India · 8+ years of impact</p>
                </div>
                <div class="about-stats">
                    <div class="stat-card"><span class="number">18+</span><div class="label">projects delivered</div></div>
                    <div class="stat-card"><span class="number">99.9%</span><div class="label">uptime achieved</div></div>
                    <div class="stat-card"><span class="number">10+</span><div class="label">cloud certifications</div></div>
                    <div class="stat-card"><span class="number">∞</span><div class="label">automation mindset</div></div>
                </div>
            </div>
        </section>

        <!-- SKILLS -->
        <section id="skills">
            <div class="section-title">
                <i class="fas fa-microchip"></i> Skills & Toolchain
            </div>
            <div class="skills-cloud">
                <span class="skill-chip"><i class="fab fa-jenkins"></i> Jenkins</span>
                <span class="skill-chip"><i class="fab fa-github"></i> GitHub Actions</span>
                <span class="skill-chip"><i class="fab fa-docker"></i> Docker</span>
                <span class="skill-chip"><i class="fas fa-cubes"></i> Kubernetes</span>
                <span class="skill-chip"><i class="fas fa-code-branch"></i> Terraform</span>
                <span class="skill-chip"><i class="fab fa-aws"></i> AWS</span>
                <span class="skill-chip"><i class="fab fa-microsoft"></i> Azure</span>
                <span class="skill-chip"><i class="fas fa-chart-line"></i> Prometheus · Grafana</span>
                <span class="skill-chip"><i class="fas fa-shield-alt"></i> SonarQube · Trivy</span>
                <span class="skill-chip"><i class="fas fa-leaf"></i> Spring Boot</span>
            </div>
        </section>

        <!-- PROJECTS -->
        <section id="projects">
            <div class="section-title">
                <i class="fas fa-folder-open"></i> Featured Projects
            </div>
            <div class="project-grid">
                <div class="project-card">
                    <div class="icon"><i class="fas fa-university"></i></div>
                    <h3>Bank App · Azure</h3>
                    <p>Three‑tier banking application deployed on AKS with MySQL, Redis, and automatic failover. Secured with Azure Key Vault.</p>
                    <span class="project-tag"><i class="fas fa-cog"></i> K8s · Azure · Helm</span>
                </div>
                <div class="project-card">
                    <div class="icon"><i class="fas fa-code-branch"></i></div>
                    <h3>CI/CD · Security First</h3>
                    <p>End‑to‑end Jenkins pipeline with SonarQube, Trivy, and Docker image scanning. Zero‑trust artifact promotion.</p>
                    <span class="project-tag"><i class="fas fa-shield"></i> Jenkins · Trivy · Docker</span>
                </div>
                <div class="project-card">
                    <div class="icon"><i class="fas fa-cloud"></i></div>
                    <h3>AWS Infra as Code</h3>
                    <p>Automated VPC, EC2, RDS, and ALB using Terraform & CloudFormation. GitOps with CI/CD integration.</p>
                    <span class="project-tag"><i class="fas fa-terminal"></i> Terraform · AWS · CFT</span>
                </div>
            </div>
        </section>

        <!-- CONTACT -->
        <section id="contact">
            <div class="section-title">
                <i class="fas fa-paper-plane"></i> Let's Connect
            </div>
            <div class="contact-wrapper">
                <div class="contact-info">
                    <h4><i class="fas fa-comment-dots" style="color: #38bdf8;"></i> Reach out</h4>
                    <p><i class="fas fa-envelope"></i> varma.devops@springboot.io</p>
                    <p><i class="fas fa-phone-alt"></i> +91 98765 43210</p>
                    <p><i class="fab fa-github"></i> github.com/varma-devops</p>
                    <p><i class="fab fa-linkedin"></i> linkedin.com/in/varma-devops</p>
                    <p style="margin-top: 2rem; opacity: 0.7; font-size: 0.9rem;">
                        <i class="fas fa-clock"></i> Available for consulting & full‑time roles
                    </p>
                </div>
                <div class="contact-form">
                    <form>
                        <input type="text" placeholder="Your name" required>
                        <input type="email" placeholder="Your email" required>
                        <textarea placeholder="Tell me about your project or idea…" rows="4" required></textarea>
                        <button type="submit"><i class="fas fa-paper-plane"></i> Send message</button>
                    </form>
                </div>
            </div>
        </section>

    </main>

    <footer class="container footer">
        <div>
            <i class="fas fa-crown" style="color: #38bdf8; opacity: 0.5;"></i> 
            © 2025 VARMA · DevOps & Springboot
        </div>
        <div class="footer-socials">
            <a href="#about"><i class="fas fa-arrow-up"></i> Back to top</a>
            <a href="#" aria-label="GitHub"><i class="fab fa-github"></i></a>
            <a href="#" aria-label="LinkedIn"><i class="fab fa-linkedin-in"></i></a>
            <a href="#" aria-label="Twitter"><i class="fab fa-x-twitter"></i></a>
        </div>
    </footer>

    <!-- subtle animation on load (optional) -->
</body>
</html>
