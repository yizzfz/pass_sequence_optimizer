; ModuleID = 'A.ll'
source_filename = "doitgen.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define void @kernel_doitgen(i32 %nr, i32 %nq, i32 %np, [140 x [160 x double]]* %A, [160 x double]* %C4, double* %sum) local_unnamed_addr #0 {
entry:
  %cmp48 = icmp sgt i32 %nr, 0
  br i1 %cmp48, label %for.cond1.preheader.lr.ph, label %for.end44

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %0 = zext i32 %np to i64
  %1 = add nsw i64 %0, -1
  %2 = icmp sgt i32 %nq, 0
  %3 = icmp sgt i32 %np, 0
  %xtraiter87 = and i64 %0, 1
  %lcmp.mod88 = icmp eq i64 %xtraiter87, 0
  %4 = icmp eq i64 %1, 0
  %sunkaddr95 = ptrtoint double* %sum to i64
  %xtraiter89 = and i64 %0, 3
  %lcmp.mod90 = icmp eq i64 %xtraiter89, 0
  %5 = icmp ult i64 %1, 3
  %wide.trip.count81 = zext i32 %nq to i64
  %wide.trip.count85 = zext i32 %nr to i64
  %xtraiter = and i64 %wide.trip.count81, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %6 = icmp eq i32 %nq, 1
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc42, %for.cond1.preheader.lr.ph
  %indvars.iv83 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next84, %for.inc42 ]
  br i1 %2, label %for.cond4.preheader.lr.ph, label %for.inc42

for.cond4.preheader.lr.ph:                        ; preds = %for.cond1.preheader
  br i1 %3, label %for.cond4.preheader.us.preheader, label %for.cond4.preheader.preheader

for.cond4.preheader.preheader:                    ; preds = %for.cond4.preheader.lr.ph
  br i1 %lcmp.mod, label %for.cond4.preheader.prol.loopexit.unr-lcssa, label %for.cond4.preheader.prol.preheader

for.cond4.preheader.prol.preheader:               ; preds = %for.cond4.preheader.preheader
  br label %for.cond4.preheader.prol

for.cond4.preheader.prol:                         ; preds = %for.cond4.preheader.prol.preheader
  br i1 false, label %for.inc36.lr.ph.prol, label %for.inc39.prol

for.inc36.lr.ph.prol:                             ; preds = %for.cond4.preheader.prol
  br i1 %lcmp.mod90, label %for.inc36.prol.loopexit.prol, label %for.inc36.prol.preheader.prol

for.inc36.prol.preheader.prol:                    ; preds = %for.inc36.lr.ph.prol
  br label %for.inc36.prol.prol

for.inc36.prol.prol:                              ; preds = %for.inc36.prol.prol, %for.inc36.prol.preheader.prol
  br i1 true, label %for.inc36.prol.loopexit.loopexit.prol, label %for.inc36.prol.prol, !llvm.loop !1

for.inc36.prol.loopexit.loopexit.prol:            ; preds = %for.inc36.prol.prol
  br label %for.inc36.prol.loopexit.prol

for.inc36.prol.loopexit.prol:                     ; preds = %for.inc36.prol.loopexit.loopexit.prol, %for.inc36.lr.ph.prol
  br label %for.inc36.preheader.prol

for.inc36.preheader.prol:                         ; preds = %for.inc36.prol.loopexit.prol
  br label %for.inc36.prol102

for.inc36.prol102:                                ; preds = %for.inc36.preheader.prol
  br label %for.inc39.prol

for.inc36.prol.loopexit.for.inc39_crit_edge.prol: ; No predecessors!
  unreachable

for.inc39.prol:                                   ; preds = %for.inc36.prol102, %for.cond4.preheader.prol
  br label %for.cond4.preheader.prol.loopexit.unr-lcssa

for.cond4.preheader.prol.loopexit.unr-lcssa:      ; preds = %for.cond4.preheader.preheader, %for.inc39.prol
  %indvars.iv55.unr.ph = phi i64 [ 1, %for.inc39.prol ], [ 0, %for.cond4.preheader.preheader ]
  br label %for.cond4.preheader.prol.loopexit

for.cond4.preheader.prol.loopexit:                ; preds = %for.cond4.preheader.prol.loopexit.unr-lcssa
  br i1 %6, label %for.inc42.loopexit101, label %for.cond4.preheader.preheader.new

for.cond4.preheader.preheader.new:                ; preds = %for.cond4.preheader.prol.loopexit
  br label %for.cond4.preheader

for.cond4.preheader.us.preheader:                 ; preds = %for.cond4.preheader.lr.ph
  br label %for.cond4.preheader.us

for.cond4.preheader.us:                           ; preds = %for.cond4.preheader.us.preheader, %for.inc39.us
  %indvars.iv79 = phi i64 [ %indvars.iv.next80, %for.inc39.us ], [ 0, %for.cond4.preheader.us.preheader ]
  br i1 true, label %for.body6.us.us.preheader, label %for.cond4.for.cond25.preheader_crit_edge.us.thread

for.body6.us.us.preheader:                        ; preds = %for.cond4.preheader.us
  %arrayidx15.us.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv83, i64 %indvars.iv79, i64 0
  br label %for.body6.us.us

for.cond4.for.cond25.preheader_crit_edge.us.thread: ; preds = %for.cond4.preheader.us
  br label %for.inc39.us

for.inc39.us.loopexit:                            ; preds = %for.inc36.us
  br label %for.inc39.us

for.inc39.us:                                     ; preds = %for.inc39.us.loopexit, %for.cond4.for.cond25.preheader_crit_edge.us.for.inc39.us_crit_edge, %for.cond4.for.cond25.preheader_crit_edge.us.thread, %for.inc36.us.prol.loopexit
  %indvars.iv.next80 = add nuw nsw i64 %indvars.iv79, 1
  %exitcond82 = icmp eq i64 %indvars.iv.next80, %wide.trip.count81
  br i1 %exitcond82, label %for.inc42.loopexit, label %for.cond4.preheader.us

for.inc36.us:                                     ; preds = %for.inc36.us.preheader, %for.inc36.us
  %indvars.iv72 = phi i64 [ %indvars.iv.next73.3, %for.inc36.us ], [ %indvars.iv72.unr, %for.inc36.us.preheader ]
  %arrayidx29.us = getelementptr inbounds double, double* %sum, i64 %indvars.iv72
  %7 = bitcast double* %arrayidx29.us to i64*
  %8 = load i64, i64* %7, align 8
  %arrayidx35.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv83, i64 %indvars.iv79, i64 %indvars.iv72
  %9 = bitcast double* %arrayidx35.us to i64*
  store i64 %8, i64* %9, align 8
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %arrayidx29.us.1 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next73
  %10 = bitcast double* %arrayidx29.us.1 to i64*
  %11 = load i64, i64* %10, align 8
  %arrayidx35.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv83, i64 %indvars.iv79, i64 %indvars.iv.next73
  %12 = bitcast double* %arrayidx35.us.1 to i64*
  store i64 %11, i64* %12, align 8
  %indvars.iv.next73.1 = add nsw i64 %indvars.iv72, 2
  %arrayidx29.us.2 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next73.1
  %13 = bitcast double* %arrayidx29.us.2 to i64*
  %14 = load i64, i64* %13, align 8
  %arrayidx35.us.2 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv83, i64 %indvars.iv79, i64 %indvars.iv.next73.1
  %15 = bitcast double* %arrayidx35.us.2 to i64*
  store i64 %14, i64* %15, align 8
  %indvars.iv.next73.2 = add nsw i64 %indvars.iv72, 3
  %arrayidx29.us.3 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next73.2
  %16 = bitcast double* %arrayidx29.us.3 to i64*
  %17 = load i64, i64* %16, align 8
  %arrayidx35.us.3 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv83, i64 %indvars.iv79, i64 %indvars.iv.next73.2
  %18 = bitcast double* %arrayidx35.us.3 to i64*
  store i64 %17, i64* %18, align 8
  %indvars.iv.next73.3 = add nsw i64 %indvars.iv72, 4
  %exitcond75.3 = icmp eq i64 %indvars.iv.next73.3, %0
  br i1 %exitcond75.3, label %for.inc39.us.loopexit, label %for.inc36.us

for.cond4.for.cond25.preheader_crit_edge.us:      ; preds = %for.cond7.for.inc22_crit_edge.us.us
  br i1 true, label %for.inc36.lr.ph.us, label %for.cond4.for.cond25.preheader_crit_edge.us.for.inc39.us_crit_edge

for.cond4.for.cond25.preheader_crit_edge.us.for.inc39.us_crit_edge: ; preds = %for.cond4.for.cond25.preheader_crit_edge.us
  br label %for.inc39.us

for.body6.us.us:                                  ; preds = %for.body6.us.us.preheader, %for.cond7.for.inc22_crit_edge.us.us
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %for.cond7.for.inc22_crit_edge.us.us ], [ 0, %for.body6.us.us.preheader ]
  %arrayidx.us.us = getelementptr inbounds double, double* %sum, i64 %indvars.iv68
  store double 0.000000e+00, double* %arrayidx.us.us, align 8
  br i1 %lcmp.mod88, label %for.inc.us.us.prol.loopexit, label %for.inc.us.us.prol

for.inc.us.us.prol:                               ; preds = %for.body6.us.us
  %19 = load double, double* %arrayidx15.us.us.prol, align 8
  %arrayidx19.us.us.prol = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 0, i64 %indvars.iv68
  %20 = load double, double* %arrayidx19.us.us.prol, align 8
  %mul.us.us.prol = fmul double %19, %20
  %add.us.us.prol = fadd double %mul.us.us.prol, 0.000000e+00
  %sunkaddr92 = shl i64 %indvars.iv68, 3
  %sunkaddr93 = add i64 %sunkaddr95, %sunkaddr92
  %sunkaddr94 = inttoptr i64 %sunkaddr93 to double*
  store double %add.us.us.prol, double* %sunkaddr94, align 8
  br label %for.inc.us.us.prol.loopexit

for.inc.us.us.prol.loopexit:                      ; preds = %for.body6.us.us, %for.inc.us.us.prol
  %indvars.iv64.unr.ph = phi i64 [ 1, %for.inc.us.us.prol ], [ 0, %for.body6.us.us ]
  %.unr.ph = phi double [ %add.us.us.prol, %for.inc.us.us.prol ], [ 0.000000e+00, %for.body6.us.us ]
  br i1 %4, label %for.cond7.for.inc22_crit_edge.us.us, label %for.inc.us.us.preheader

for.inc.us.us.preheader:                          ; preds = %for.inc.us.us.prol.loopexit
  %sunkaddr96 = shl i64 %indvars.iv68, 3
  %sunkaddr97 = add i64 %sunkaddr95, %sunkaddr96
  %sunkaddr98 = inttoptr i64 %sunkaddr97 to double*
  br label %for.inc.us.us

for.cond7.for.inc22_crit_edge.us.us.loopexit:     ; preds = %for.inc.us.us
  br label %for.cond7.for.inc22_crit_edge.us.us

for.cond7.for.inc22_crit_edge.us.us:              ; preds = %for.cond7.for.inc22_crit_edge.us.us.loopexit, %for.inc.us.us.prol.loopexit
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next69, %0
  br i1 %exitcond71, label %for.cond4.for.cond25.preheader_crit_edge.us, label %for.body6.us.us

for.inc.us.us:                                    ; preds = %for.inc.us.us.preheader, %for.inc.us.us
  %indvars.iv64 = phi i64 [ %indvars.iv.next65.1, %for.inc.us.us ], [ %indvars.iv64.unr.ph, %for.inc.us.us.preheader ]
  %21 = phi double [ %add.us.us.1, %for.inc.us.us ], [ %.unr.ph, %for.inc.us.us.preheader ]
  %arrayidx15.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv83, i64 %indvars.iv79, i64 %indvars.iv64
  %22 = load double, double* %arrayidx15.us.us, align 8
  %arrayidx19.us.us = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv64, i64 %indvars.iv68
  %23 = load double, double* %arrayidx19.us.us, align 8
  %mul.us.us = fmul double %22, %23
  %add.us.us = fadd double %21, %mul.us.us
  store double %add.us.us, double* %sunkaddr98, align 8
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %arrayidx15.us.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv83, i64 %indvars.iv79, i64 %indvars.iv.next65
  %24 = load double, double* %arrayidx15.us.us.1, align 8
  %arrayidx19.us.us.1 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv.next65, i64 %indvars.iv68
  %25 = load double, double* %arrayidx19.us.us.1, align 8
  %mul.us.us.1 = fmul double %24, %25
  %add.us.us.1 = fadd double %add.us.us, %mul.us.us.1
  store double %add.us.us.1, double* %sunkaddr98, align 8
  %indvars.iv.next65.1 = add nsw i64 %indvars.iv64, 2
  %exitcond67.1 = icmp eq i64 %indvars.iv.next65.1, %0
  br i1 %exitcond67.1, label %for.cond7.for.inc22_crit_edge.us.us.loopexit, label %for.inc.us.us

for.inc36.lr.ph.us:                               ; preds = %for.cond4.for.cond25.preheader_crit_edge.us
  br i1 %lcmp.mod90, label %for.inc36.us.prol.loopexit, label %for.inc36.us.prol.preheader

for.inc36.us.prol.preheader:                      ; preds = %for.inc36.lr.ph.us
  br label %for.inc36.us.prol

for.inc36.us.prol:                                ; preds = %for.inc36.us.prol.preheader, %for.inc36.us.prol
  %indvars.iv72.prol = phi i64 [ %indvars.iv.next73.prol, %for.inc36.us.prol ], [ 0, %for.inc36.us.prol.preheader ]
  %prol.iter91 = phi i64 [ %prol.iter91.sub, %for.inc36.us.prol ], [ %xtraiter89, %for.inc36.us.prol.preheader ]
  %arrayidx29.us.prol = getelementptr inbounds double, double* %sum, i64 %indvars.iv72.prol
  %26 = bitcast double* %arrayidx29.us.prol to i64*
  %27 = load i64, i64* %26, align 8
  %arrayidx35.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv83, i64 %indvars.iv79, i64 %indvars.iv72.prol
  %28 = bitcast double* %arrayidx35.us.prol to i64*
  store i64 %27, i64* %28, align 8
  %indvars.iv.next73.prol = add nuw nsw i64 %indvars.iv72.prol, 1
  %prol.iter91.sub = add i64 %prol.iter91, -1
  %prol.iter91.cmp = icmp eq i64 %prol.iter91.sub, 0
  br i1 %prol.iter91.cmp, label %for.inc36.us.prol.loopexit.loopexit, label %for.inc36.us.prol, !llvm.loop !3

for.inc36.us.prol.loopexit.loopexit:              ; preds = %for.inc36.us.prol
  br label %for.inc36.us.prol.loopexit

for.inc36.us.prol.loopexit:                       ; preds = %for.inc36.us.prol.loopexit.loopexit, %for.inc36.lr.ph.us
  %indvars.iv72.unr = phi i64 [ 0, %for.inc36.lr.ph.us ], [ %indvars.iv.next73.prol, %for.inc36.us.prol.loopexit.loopexit ]
  br i1 %5, label %for.inc39.us, label %for.inc36.us.preheader

for.inc36.us.preheader:                           ; preds = %for.inc36.us.prol.loopexit
  br label %for.inc36.us

for.cond4.preheader:                              ; preds = %for.inc39.1, %for.cond4.preheader.preheader.new
  %indvars.iv55 = phi i64 [ %indvars.iv55.unr.ph, %for.cond4.preheader.preheader.new ], [ %indvars.iv.next56.1, %for.inc39.1 ]
  br i1 false, label %for.inc36.lr.ph, label %for.inc39

for.inc36.lr.ph:                                  ; preds = %for.cond4.preheader
  br i1 %lcmp.mod90, label %for.inc36.prol.loopexit, label %for.inc36.prol.preheader

for.inc36.prol.preheader:                         ; preds = %for.inc36.lr.ph
  br label %for.inc36.prol

for.inc36.prol:                                   ; preds = %for.inc36.prol.preheader, %for.inc36.prol
  br i1 true, label %for.inc36.prol.loopexit.loopexit, label %for.inc36.prol, !llvm.loop !1

for.inc36.prol.loopexit.loopexit:                 ; preds = %for.inc36.prol
  br label %for.inc36.prol.loopexit

for.inc36.prol.loopexit:                          ; preds = %for.inc36.prol.loopexit.loopexit, %for.inc36.lr.ph
  br label %for.inc36.preheader

for.inc36.preheader:                              ; preds = %for.inc36.prol.loopexit
  br label %for.inc36

for.inc36.prol.loopexit.for.inc39_crit_edge:      ; No predecessors!
  unreachable

for.inc36:                                        ; preds = %for.inc36.preheader
  br label %for.inc39

for.inc39:                                        ; preds = %for.inc36, %for.cond4.preheader
  br i1 false, label %for.inc36.lr.ph.1, label %for.inc39.1

for.inc42.loopexit:                               ; preds = %for.inc39.us
  br label %for.inc42

for.inc42.loopexit101.unr-lcssa:                  ; preds = %for.inc39.1
  br label %for.inc42.loopexit101

for.inc42.loopexit101:                            ; preds = %for.cond4.preheader.prol.loopexit, %for.inc42.loopexit101.unr-lcssa
  br label %for.inc42

for.inc42:                                        ; preds = %for.inc42.loopexit101, %for.inc42.loopexit, %for.cond1.preheader
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1
  %exitcond86 = icmp eq i64 %indvars.iv.next84, %wide.trip.count85
  br i1 %exitcond86, label %for.end44.loopexit, label %for.cond1.preheader

for.end44.loopexit:                               ; preds = %for.inc42
  br label %for.end44

for.end44:                                        ; preds = %for.end44.loopexit, %entry
  ret void

for.inc36.lr.ph.1:                                ; preds = %for.inc39
  br i1 %lcmp.mod90, label %for.inc36.prol.loopexit.1, label %for.inc36.prol.preheader.1

for.inc36.prol.preheader.1:                       ; preds = %for.inc36.lr.ph.1
  br label %for.inc36.prol.1

for.inc36.prol.1:                                 ; preds = %for.inc36.prol.1, %for.inc36.prol.preheader.1
  br i1 true, label %for.inc36.prol.loopexit.loopexit.1, label %for.inc36.prol.1, !llvm.loop !1

for.inc36.prol.loopexit.loopexit.1:               ; preds = %for.inc36.prol.1
  br label %for.inc36.prol.loopexit.1

for.inc36.prol.loopexit.1:                        ; preds = %for.inc36.prol.loopexit.loopexit.1, %for.inc36.lr.ph.1
  br label %for.inc36.preheader.1

for.inc36.preheader.1:                            ; preds = %for.inc36.prol.loopexit.1
  br label %for.inc36.1

for.inc36.1:                                      ; preds = %for.inc36.preheader.1
  br label %for.inc39.1

for.inc36.prol.loopexit.for.inc39_crit_edge.1:    ; No predecessors!
  unreachable

for.inc39.1:                                      ; preds = %for.inc36.1, %for.inc39
  %indvars.iv.next56.1 = add nsw i64 %indvars.iv55, 2
  %exitcond58.1 = icmp eq i64 %indvars.iv.next56.1, %wide.trip.count81
  br i1 %exitcond58.1, label %for.inc42.loopexit101.unr-lcssa, label %for.cond4.preheader
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 3360000, i32 8) #3
  %call1 = tail call i8* @polybench_alloc_data(i64 160, i32 8) #3
  %call2 = tail call i8* @polybench_alloc_data(i64 25600, i32 8) #3
  %arraydecay = bitcast i8* %call to [140 x [160 x double]]*
  %arraydecay3 = bitcast i8* %call2 to [160 x double]*
  tail call fastcc void @init_array([140 x [160 x double]]* %arraydecay, [160 x double]* %arraydecay3)
  tail call void (...) @polybench_timer_start() #3
  %arraydecay6 = bitcast i8* %call1 to double*
  tail call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %arraydecay, [160 x double]* %arraydecay3, double* %arraydecay6)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call fastcc void @print_array([140 x [160 x double]]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #3
  tail call void @free(i8* %call1) #3
  tail call void @free(i8* %call2) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([140 x [160 x double]]* %A, [160 x double]* %C4) unnamed_addr #0 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc15, %entry
  %indvars.iv38 = phi i64 [ 0, %entry ], [ %indvars.iv.next39, %for.inc15 ]
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.inc12, %for.cond1.preheader
  %indvars.iv34 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next35, %for.inc12 ]
  %0 = mul nuw nsw i64 %indvars.iv34, %indvars.iv38
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.cond4.preheader
  %indvars.iv30 = phi i64 [ 0, %for.cond4.preheader ], [ %indvars.iv.next31.1, %for.inc ]
  %1 = add nuw nsw i64 %indvars.iv30, %0
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 160
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 1.600000e+02
  %arrayidx11 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv38, i64 %indvars.iv34, i64 %indvars.iv30
  store double %div, double* %arrayidx11, align 8
  %indvars.iv.next31 = or i64 %indvars.iv30, 1
  %3 = add nuw nsw i64 %indvars.iv.next31, %0
  %4 = trunc i64 %3 to i32
  %rem.1 = srem i32 %4, 160
  %conv.1 = sitofp i32 %rem.1 to double
  %div.1 = fdiv double %conv.1, 1.600000e+02
  %arrayidx11.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv38, i64 %indvars.iv34, i64 %indvars.iv.next31
  store double %div.1, double* %arrayidx11.1, align 8
  %indvars.iv.next31.1 = add nsw i64 %indvars.iv30, 2
  %exitcond33.1 = icmp eq i64 %indvars.iv.next31.1, 160
  br i1 %exitcond33.1, label %for.inc12, label %for.inc

for.inc12:                                        ; preds = %for.inc
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next35, 140
  br i1 %exitcond37, label %for.inc15, label %for.cond4.preheader

for.inc15:                                        ; preds = %for.inc12
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next39, 150
  br i1 %exitcond40, label %for.cond22.preheader.preheader, label %for.cond1.preheader

for.cond22.preheader.preheader:                   ; preds = %for.inc15
  br label %for.cond22.preheader

for.cond22.preheader:                             ; preds = %for.cond22.preheader.preheader, %for.inc38
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %for.inc38 ], [ 0, %for.cond22.preheader.preheader ]
  br label %for.inc35

for.inc35:                                        ; preds = %for.inc35, %for.cond22.preheader
  %indvars.iv = phi i64 [ 0, %for.cond22.preheader ], [ %indvars.iv.next.1, %for.inc35 ]
  %5 = mul nuw nsw i64 %indvars.iv, %indvars.iv27
  %6 = trunc i64 %5 to i32
  %rem27 = srem i32 %6, 160
  %conv28 = sitofp i32 %rem27 to double
  %div30 = fdiv double %conv28, 1.600000e+02
  %arrayidx34 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv27, i64 %indvars.iv
  store double %div30, double* %arrayidx34, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %7 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv27
  %8 = trunc i64 %7 to i32
  %rem27.1 = srem i32 %8, 160
  %conv28.1 = sitofp i32 %rem27.1 to double
  %div30.1 = fdiv double %conv28.1, 1.600000e+02
  %arrayidx34.1 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv27, i64 %indvars.iv.next
  store double %div30.1, double* %arrayidx34.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond.1, label %for.inc38, label %for.inc35

for.inc38:                                        ; preds = %for.inc35
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next28, 160
  br i1 %exitcond29, label %for.end40, label %for.cond22.preheader

for.end40:                                        ; preds = %for.inc38
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([140 x [160 x double]]* %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #4
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc21, %entry
  %indvars.iv21 = phi i64 [ 0, %entry ], [ %indvars.iv.next22, %for.inc21 ]
  %3 = mul nuw nsw i64 %indvars.iv21, 140
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.inc18, %for.cond2.preheader
  %indvars.iv16 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next17, %for.inc18 ]
  %4 = add nuw nsw i64 %indvars.iv16, %3
  %5 = mul nuw nsw i64 %4, 160
  br label %for.body7

for.body7:                                        ; preds = %for.inc, %for.cond5.preheader
  %indvars.iv = phi i64 [ 0, %for.cond5.preheader ], [ %indvars.iv.next, %for.inc ]
  %6 = add nuw nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %rem = srem i32 %7, 20
  %cmp11 = icmp eq i32 %rem, 0
  br i1 %cmp11, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body7
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %8) #4
  br label %for.inc

for.inc:                                          ; preds = %for.body7, %if.then
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv21, i64 %indvars.iv16, i64 %indvars.iv
  %10 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %10) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond, label %for.inc18, label %for.body7

for.inc18:                                        ; preds = %for.inc
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next17, 140
  br i1 %exitcond20, label %for.inc21, label %for.cond5.preheader

for.inc21:                                        ; preds = %for.inc18
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next22, 150
  br i1 %exitcond24, label %for.end23, label %for.cond2.preheader

for.end23:                                        ; preds = %for.inc21
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %12) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
