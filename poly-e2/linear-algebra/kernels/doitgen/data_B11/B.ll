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
define void @kernel_doitgen(i32 %nr, i32 %nq, i32 %np, [140 x [160 x double]]* nocapture %A, [160 x double]* nocapture readonly %C4, double* %sum) local_unnamed_addr #0 {
entry:
  %cmp54 = icmp sgt i32 %nr, 0
  br i1 %cmp54, label %for.cond1.preheader.lr.ph, label %entry.for.end44_crit_edge

entry.for.end44_crit_edge:                        ; preds = %entry
  br label %for.end44

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %0 = zext i32 %np to i64
  %1 = add nsw i64 %0, -1
  %2 = icmp sgt i32 %nq, 0
  %3 = icmp sgt i32 %np, 0
  %xtraiter93 = and i64 %0, 1
  %lcmp.mod94 = icmp eq i64 %xtraiter93, 0
  %4 = icmp eq i64 %1, 0
  %sunkaddr101 = ptrtoint double* %sum to i64
  %sunkaddr105 = ptrtoint double* %sum to i64
  %sunkaddr = ptrtoint double* %sum to i64
  %xtraiter95 = and i64 %0, 3
  %lcmp.mod96 = icmp eq i64 %xtraiter95, 0
  %5 = icmp ult i64 %1, 3
  %wide.trip.count87 = zext i32 %nq to i64
  %wide.trip.count63 = zext i32 %nq to i64
  %wide.trip.count91 = zext i32 %nr to i64
  %6 = add nsw i64 %wide.trip.count63, -1
  %xtraiter = and i64 %wide.trip.count63, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %7 = icmp ult i64 %6, 7
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc42.for.cond1.preheader_crit_edge, %for.cond1.preheader.lr.ph
  %indvars.iv89 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next90, %for.inc42.for.cond1.preheader_crit_edge ]
  br i1 %2, label %for.cond4.preheader.lr.ph, label %for.cond1.preheader.for.inc42_crit_edge

for.cond1.preheader.for.inc42_crit_edge:          ; preds = %for.cond1.preheader
  br label %for.inc42

for.cond4.preheader.lr.ph:                        ; preds = %for.cond1.preheader
  br i1 %3, label %for.body6.us.us.preheader.preheader, label %for.inc39.preheader

for.inc39.preheader:                              ; preds = %for.cond4.preheader.lr.ph
  br i1 %lcmp.mod, label %for.inc39.preheader.for.inc39.prol.loopexit_crit_edge, label %for.inc39.prol.preheader

for.inc39.preheader.for.inc39.prol.loopexit_crit_edge: ; preds = %for.inc39.preheader
  br label %for.inc39.prol.loopexit

for.inc39.prol.preheader:                         ; preds = %for.inc39.preheader
  br label %for.inc39.prol

for.inc39.prol:                                   ; preds = %for.inc39.prol.for.inc39.prol_crit_edge, %for.inc39.prol.preheader
  %indvars.iv61.prol = phi i64 [ %indvars.iv.next62.prol, %for.inc39.prol.for.inc39.prol_crit_edge ], [ 0, %for.inc39.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc39.prol.for.inc39.prol_crit_edge ], [ %xtraiter, %for.inc39.prol.preheader ]
  %indvars.iv.next62.prol = add nuw nsw i64 %indvars.iv61.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc39.prol.loopexit.unr-lcssa, label %for.inc39.prol.for.inc39.prol_crit_edge, !llvm.loop !1

for.inc39.prol.for.inc39.prol_crit_edge:          ; preds = %for.inc39.prol
  br label %for.inc39.prol

for.inc39.prol.loopexit.unr-lcssa:                ; preds = %for.inc39.prol
  br label %for.inc39.prol.loopexit

for.inc39.prol.loopexit:                          ; preds = %for.inc39.preheader.for.inc39.prol.loopexit_crit_edge, %for.inc39.prol.loopexit.unr-lcssa
  %indvars.iv61.unr = phi i64 [ 0, %for.inc39.preheader.for.inc39.prol.loopexit_crit_edge ], [ %indvars.iv.next62.prol, %for.inc39.prol.loopexit.unr-lcssa ]
  br i1 %7, label %for.inc39.prol.loopexit.for.inc42.loopexit111_crit_edge, label %for.inc39.preheader.new

for.inc39.prol.loopexit.for.inc42.loopexit111_crit_edge: ; preds = %for.inc39.prol.loopexit
  br label %for.inc42.loopexit111

for.inc39.preheader.new:                          ; preds = %for.inc39.prol.loopexit
  br label %for.inc39

for.body6.us.us.preheader.preheader:              ; preds = %for.cond4.preheader.lr.ph
  br label %for.body6.us.us.preheader

for.body6.us.us.preheader:                        ; preds = %for.inc39.us.for.body6.us.us.preheader_crit_edge, %for.body6.us.us.preheader.preheader
  %indvars.iv85 = phi i64 [ %indvars.iv.next86, %for.inc39.us.for.body6.us.us.preheader_crit_edge ], [ 0, %for.body6.us.us.preheader.preheader ]
  %arrayidx15.us.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv89, i64 %indvars.iv85, i64 0
  br label %for.body6.us.us

for.inc39.us.loopexit:                            ; preds = %for.inc36.us
  br label %for.inc39.us

for.inc39.us:                                     ; preds = %for.inc36.us.prol.loopexit.for.inc39.us_crit_edge, %for.inc39.us.loopexit
  %indvars.iv.next86 = add nuw nsw i64 %indvars.iv85, 1
  %exitcond88 = icmp eq i64 %indvars.iv.next86, %wide.trip.count87
  br i1 %exitcond88, label %for.inc42.loopexit, label %for.inc39.us.for.body6.us.us.preheader_crit_edge

for.inc39.us.for.body6.us.us.preheader_crit_edge: ; preds = %for.inc39.us
  br label %for.body6.us.us.preheader

for.inc36.us:                                     ; preds = %for.inc36.us.for.inc36.us_crit_edge, %for.inc36.us.preheader
  %indvars.iv78 = phi i64 [ %indvars.iv.next79.3, %for.inc36.us.for.inc36.us_crit_edge ], [ %indvars.iv78.unr, %for.inc36.us.preheader ]
  %arrayidx29.us = getelementptr inbounds double, double* %sum, i64 %indvars.iv78
  %8 = bitcast double* %arrayidx29.us to i64*
  %9 = load i64, i64* %8, align 8
  %arrayidx35.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv89, i64 %indvars.iv85, i64 %indvars.iv78
  %10 = bitcast double* %arrayidx35.us to i64*
  store i64 %9, i64* %10, align 8
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %arrayidx29.us.1 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next79
  %11 = bitcast double* %arrayidx29.us.1 to i64*
  %12 = load i64, i64* %11, align 8
  %arrayidx35.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv89, i64 %indvars.iv85, i64 %indvars.iv.next79
  %13 = bitcast double* %arrayidx35.us.1 to i64*
  store i64 %12, i64* %13, align 8
  %indvars.iv.next79.1 = add nsw i64 %indvars.iv78, 2
  %arrayidx29.us.2 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next79.1
  %14 = bitcast double* %arrayidx29.us.2 to i64*
  %15 = load i64, i64* %14, align 8
  %arrayidx35.us.2 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv89, i64 %indvars.iv85, i64 %indvars.iv.next79.1
  %16 = bitcast double* %arrayidx35.us.2 to i64*
  store i64 %15, i64* %16, align 8
  %indvars.iv.next79.2 = add nsw i64 %indvars.iv78, 3
  %arrayidx29.us.3 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next79.2
  %17 = bitcast double* %arrayidx29.us.3 to i64*
  %18 = load i64, i64* %17, align 8
  %arrayidx35.us.3 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv89, i64 %indvars.iv85, i64 %indvars.iv.next79.2
  %19 = bitcast double* %arrayidx35.us.3 to i64*
  store i64 %18, i64* %19, align 8
  %indvars.iv.next79.3 = add nuw nsw i64 %indvars.iv78, 4
  %exitcond81.3 = icmp eq i64 %indvars.iv.next79.3, %0
  br i1 %exitcond81.3, label %for.inc39.us.loopexit, label %for.inc36.us.for.inc36.us_crit_edge

for.inc36.us.for.inc36.us_crit_edge:              ; preds = %for.inc36.us
  br label %for.inc36.us

for.body6.us.us:                                  ; preds = %for.cond7.for.inc22_crit_edge.us.us.for.body6.us.us_crit_edge, %for.body6.us.us.preheader
  %indvars.iv74 = phi i64 [ 0, %for.body6.us.us.preheader ], [ %indvars.iv.next75, %for.cond7.for.inc22_crit_edge.us.us.for.body6.us.us_crit_edge ]
  %arrayidx.us.us = getelementptr inbounds double, double* %sum, i64 %indvars.iv74
  store double 0.000000e+00, double* %arrayidx.us.us, align 8
  br i1 %lcmp.mod94, label %for.body6.us.us.for.inc.us.us.prol.loopexit.unr-lcssa_crit_edge, label %for.inc.us.us.prol.preheader

for.body6.us.us.for.inc.us.us.prol.loopexit.unr-lcssa_crit_edge: ; preds = %for.body6.us.us
  br label %for.inc.us.us.prol.loopexit.unr-lcssa

for.inc.us.us.prol.preheader:                     ; preds = %for.body6.us.us
  %20 = load double, double* %arrayidx15.us.us.prol, align 8
  %arrayidx19.us.us.prol = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 0, i64 %indvars.iv74
  %21 = load double, double* %arrayidx19.us.us.prol, align 8
  %mul.us.us.prol = fmul double %20, %21
  %sunkaddr98 = shl i64 %indvars.iv74, 3
  %sunkaddr99 = add i64 %sunkaddr, %sunkaddr98
  %sunkaddr100 = inttoptr i64 %sunkaddr99 to double*
  %22 = load double, double* %sunkaddr100, align 8
  %add.us.us.prol = fadd double %22, %mul.us.us.prol
  store double %add.us.us.prol, double* %sunkaddr100, align 8
  br label %for.inc.us.us.prol.loopexit.unr-lcssa

for.inc.us.us.prol.loopexit.unr-lcssa:            ; preds = %for.body6.us.us.for.inc.us.us.prol.loopexit.unr-lcssa_crit_edge, %for.inc.us.us.prol.preheader
  %indvars.iv70.unr.ph = phi i64 [ 1, %for.inc.us.us.prol.preheader ], [ 0, %for.body6.us.us.for.inc.us.us.prol.loopexit.unr-lcssa_crit_edge ]
  br i1 %4, label %for.inc.us.us.prol.loopexit.unr-lcssa.for.cond7.for.inc22_crit_edge.us.us_crit_edge, label %for.body6.us.us.new

for.inc.us.us.prol.loopexit.unr-lcssa.for.cond7.for.inc22_crit_edge.us.us_crit_edge: ; preds = %for.inc.us.us.prol.loopexit.unr-lcssa
  br label %for.cond7.for.inc22_crit_edge.us.us

for.body6.us.us.new:                              ; preds = %for.inc.us.us.prol.loopexit.unr-lcssa
  %sunkaddr102 = shl i64 %indvars.iv74, 3
  %sunkaddr103 = add i64 %sunkaddr101, %sunkaddr102
  %sunkaddr104 = inttoptr i64 %sunkaddr103 to double*
  %.pre = load double, double* %sunkaddr104, align 8
  %sunkaddr106 = shl i64 %indvars.iv74, 3
  %sunkaddr107 = add i64 %sunkaddr105, %sunkaddr106
  %sunkaddr108 = inttoptr i64 %sunkaddr107 to double*
  br label %for.inc.us.us

for.cond7.for.inc22_crit_edge.us.us.loopexit:     ; preds = %for.inc.us.us
  br label %for.cond7.for.inc22_crit_edge.us.us

for.cond7.for.inc22_crit_edge.us.us:              ; preds = %for.inc.us.us.prol.loopexit.unr-lcssa.for.cond7.for.inc22_crit_edge.us.us_crit_edge, %for.cond7.for.inc22_crit_edge.us.us.loopexit
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond77 = icmp eq i64 %indvars.iv.next75, %0
  br i1 %exitcond77, label %for.inc36.lr.ph.us, label %for.cond7.for.inc22_crit_edge.us.us.for.body6.us.us_crit_edge

for.cond7.for.inc22_crit_edge.us.us.for.body6.us.us_crit_edge: ; preds = %for.cond7.for.inc22_crit_edge.us.us
  br label %for.body6.us.us

for.inc.us.us:                                    ; preds = %for.inc.us.us.for.inc.us.us_crit_edge, %for.body6.us.us.new
  %23 = phi double [ %.pre, %for.body6.us.us.new ], [ %add.us.us.1, %for.inc.us.us.for.inc.us.us_crit_edge ]
  %indvars.iv70 = phi i64 [ %indvars.iv70.unr.ph, %for.body6.us.us.new ], [ %indvars.iv.next71.1, %for.inc.us.us.for.inc.us.us_crit_edge ]
  %arrayidx15.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv89, i64 %indvars.iv85, i64 %indvars.iv70
  %24 = load double, double* %arrayidx15.us.us, align 8
  %arrayidx19.us.us = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv70, i64 %indvars.iv74
  %25 = load double, double* %arrayidx19.us.us, align 8
  %mul.us.us = fmul double %24, %25
  %add.us.us = fadd double %23, %mul.us.us
  store double %add.us.us, double* %sunkaddr108, align 8
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %arrayidx15.us.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv89, i64 %indvars.iv85, i64 %indvars.iv.next71
  %26 = load double, double* %arrayidx15.us.us.1, align 8
  %arrayidx19.us.us.1 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv.next71, i64 %indvars.iv74
  %27 = load double, double* %arrayidx19.us.us.1, align 8
  %mul.us.us.1 = fmul double %26, %27
  %add.us.us.1 = fadd double %add.us.us, %mul.us.us.1
  store double %add.us.us.1, double* %sunkaddr108, align 8
  %indvars.iv.next71.1 = add nuw nsw i64 %indvars.iv70, 2
  %exitcond73.1 = icmp eq i64 %indvars.iv.next71.1, %0
  br i1 %exitcond73.1, label %for.cond7.for.inc22_crit_edge.us.us.loopexit, label %for.inc.us.us.for.inc.us.us_crit_edge

for.inc.us.us.for.inc.us.us_crit_edge:            ; preds = %for.inc.us.us
  br label %for.inc.us.us

for.inc36.lr.ph.us:                               ; preds = %for.cond7.for.inc22_crit_edge.us.us
  br i1 %lcmp.mod96, label %for.inc36.lr.ph.us.for.inc36.us.prol.loopexit_crit_edge, label %for.inc36.us.prol.preheader

for.inc36.lr.ph.us.for.inc36.us.prol.loopexit_crit_edge: ; preds = %for.inc36.lr.ph.us
  br label %for.inc36.us.prol.loopexit

for.inc36.us.prol.preheader:                      ; preds = %for.inc36.lr.ph.us
  br label %for.inc36.us.prol

for.inc36.us.prol:                                ; preds = %for.inc36.us.prol.for.inc36.us.prol_crit_edge, %for.inc36.us.prol.preheader
  %indvars.iv78.prol = phi i64 [ %indvars.iv.next79.prol, %for.inc36.us.prol.for.inc36.us.prol_crit_edge ], [ 0, %for.inc36.us.prol.preheader ]
  %prol.iter97 = phi i64 [ %prol.iter97.sub, %for.inc36.us.prol.for.inc36.us.prol_crit_edge ], [ %xtraiter95, %for.inc36.us.prol.preheader ]
  %arrayidx29.us.prol = getelementptr inbounds double, double* %sum, i64 %indvars.iv78.prol
  %28 = bitcast double* %arrayidx29.us.prol to i64*
  %29 = load i64, i64* %28, align 8
  %arrayidx35.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv89, i64 %indvars.iv85, i64 %indvars.iv78.prol
  %30 = bitcast double* %arrayidx35.us.prol to i64*
  store i64 %29, i64* %30, align 8
  %indvars.iv.next79.prol = add nuw nsw i64 %indvars.iv78.prol, 1
  %prol.iter97.sub = add nsw i64 %prol.iter97, -1
  %prol.iter97.cmp = icmp eq i64 %prol.iter97.sub, 0
  br i1 %prol.iter97.cmp, label %for.inc36.us.prol.loopexit.loopexit, label %for.inc36.us.prol.for.inc36.us.prol_crit_edge, !llvm.loop !3

for.inc36.us.prol.for.inc36.us.prol_crit_edge:    ; preds = %for.inc36.us.prol
  br label %for.inc36.us.prol

for.inc36.us.prol.loopexit.loopexit:              ; preds = %for.inc36.us.prol
  br label %for.inc36.us.prol.loopexit

for.inc36.us.prol.loopexit:                       ; preds = %for.inc36.lr.ph.us.for.inc36.us.prol.loopexit_crit_edge, %for.inc36.us.prol.loopexit.loopexit
  %indvars.iv78.unr = phi i64 [ 0, %for.inc36.lr.ph.us.for.inc36.us.prol.loopexit_crit_edge ], [ %xtraiter95, %for.inc36.us.prol.loopexit.loopexit ]
  br i1 %5, label %for.inc36.us.prol.loopexit.for.inc39.us_crit_edge, label %for.inc36.us.preheader

for.inc36.us.prol.loopexit.for.inc39.us_crit_edge: ; preds = %for.inc36.us.prol.loopexit
  br label %for.inc39.us

for.inc36.us.preheader:                           ; preds = %for.inc36.us.prol.loopexit
  br label %for.inc36.us

for.inc39:                                        ; preds = %for.inc39.for.inc39_crit_edge, %for.inc39.preheader.new
  %indvars.iv61 = phi i64 [ %indvars.iv61.unr, %for.inc39.preheader.new ], [ %indvars.iv.next62.7, %for.inc39.for.inc39_crit_edge ]
  %indvars.iv.next62.7 = add nsw i64 %indvars.iv61, 8
  %exitcond64.7 = icmp eq i64 %indvars.iv.next62.7, %wide.trip.count63
  br i1 %exitcond64.7, label %for.inc42.loopexit111.unr-lcssa, label %for.inc39.for.inc39_crit_edge

for.inc39.for.inc39_crit_edge:                    ; preds = %for.inc39
  br label %for.inc39

for.inc42.loopexit:                               ; preds = %for.inc39.us
  br label %for.inc42

for.inc42.loopexit111.unr-lcssa:                  ; preds = %for.inc39
  br label %for.inc42.loopexit111

for.inc42.loopexit111:                            ; preds = %for.inc39.prol.loopexit.for.inc42.loopexit111_crit_edge, %for.inc42.loopexit111.unr-lcssa
  br label %for.inc42

for.inc42:                                        ; preds = %for.cond1.preheader.for.inc42_crit_edge, %for.inc42.loopexit111, %for.inc42.loopexit
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  %exitcond92 = icmp eq i64 %indvars.iv.next90, %wide.trip.count91
  br i1 %exitcond92, label %for.end44.loopexit, label %for.inc42.for.cond1.preheader_crit_edge

for.inc42.for.cond1.preheader_crit_edge:          ; preds = %for.inc42
  br label %for.cond1.preheader

for.end44.loopexit:                               ; preds = %for.inc42
  br label %for.end44

for.end44:                                        ; preds = %entry.for.end44_crit_edge, %for.end44.loopexit
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %arraydecay12 = bitcast i8* %call to [140 x [160 x double]]*
  %arraydecay3 = bitcast i8* %call2 to [160 x double]*
  tail call fastcc void @init_array([140 x [160 x double]]* %arraydecay12, [160 x double]* %arraydecay3)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay614 = bitcast i8* %call1 to double*
  tail call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %arraydecay12, [160 x double]* %arraydecay3, double* %arraydecay614)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %entry.if.end_crit_edge

entry.if.end_crit_edge:                           ; preds = %entry
  br label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %land.lhs.true.if.end_crit_edge

land.lhs.true.if.end_crit_edge:                   ; preds = %land.lhs.true
  br label %if.end

if.then:                                          ; preds = %land.lhs.true
  %1 = bitcast i8* %call to [140 x [160 x double]]*
  tail call fastcc void @print_array([140 x [160 x double]]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true.if.end_crit_edge, %entry.if.end_crit_edge, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([140 x [160 x double]]* nocapture %A, [160 x double]* nocapture %C4) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc15.for.cond1.preheader_crit_edge, %entry
  %indvars.iv38 = phi i64 [ 0, %entry ], [ %indvars.iv.next39, %for.inc15.for.cond1.preheader_crit_edge ]
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.inc12.for.cond4.preheader_crit_edge, %for.cond1.preheader
  %indvars.iv34 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next35, %for.inc12.for.cond4.preheader_crit_edge ]
  %0 = mul nuw nsw i64 %indvars.iv34, %indvars.iv38
  br label %for.inc

for.inc:                                          ; preds = %for.inc.for.inc_crit_edge, %for.cond4.preheader
  %indvars.iv30 = phi i64 [ 0, %for.cond4.preheader ], [ %indvars.iv.next31.1, %for.inc.for.inc_crit_edge ]
  %1 = add nuw nsw i64 %indvars.iv30, %0
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 160
  %conv = sitofp i32 %rem to double
  %arrayidx11 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv38, i64 %indvars.iv34, i64 %indvars.iv30
  %indvars.iv.next31 = or i64 %indvars.iv30, 1
  %3 = add nuw nsw i64 %indvars.iv.next31, %0
  %4 = trunc i64 %3 to i32
  %rem.1 = srem i32 %4, 160
  %conv.1 = sitofp i32 %rem.1 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 1.600000e+02, double 1.600000e+02>
  %5 = bitcast double* %arrayidx11 to <2 x double>*
  store <2 x double> %div, <2 x double>* %5, align 8
  %indvars.iv.next31.1 = add nuw nsw i64 %indvars.iv30, 2
  %exitcond33.1 = icmp eq i64 %indvars.iv.next31.1, 160
  br i1 %exitcond33.1, label %for.inc12, label %for.inc.for.inc_crit_edge

for.inc.for.inc_crit_edge:                        ; preds = %for.inc
  br label %for.inc

for.inc12:                                        ; preds = %for.inc
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next35, 140
  br i1 %exitcond37, label %for.inc15, label %for.inc12.for.cond4.preheader_crit_edge

for.inc12.for.cond4.preheader_crit_edge:          ; preds = %for.inc12
  br label %for.cond4.preheader

for.inc15:                                        ; preds = %for.inc12
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next39, 150
  br i1 %exitcond40, label %for.cond22.preheader.preheader, label %for.inc15.for.cond1.preheader_crit_edge

for.inc15.for.cond1.preheader_crit_edge:          ; preds = %for.inc15
  br label %for.cond1.preheader

for.cond22.preheader.preheader:                   ; preds = %for.inc15
  br label %for.cond22.preheader

for.cond22.preheader:                             ; preds = %for.inc38.for.cond22.preheader_crit_edge, %for.cond22.preheader.preheader
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %for.inc38.for.cond22.preheader_crit_edge ], [ 0, %for.cond22.preheader.preheader ]
  br label %for.inc35

for.inc35:                                        ; preds = %for.inc35.for.inc35_crit_edge, %for.cond22.preheader
  %indvars.iv = phi i64 [ 0, %for.cond22.preheader ], [ %indvars.iv.next.1, %for.inc35.for.inc35_crit_edge ]
  %6 = mul nuw nsw i64 %indvars.iv, %indvars.iv27
  %7 = trunc i64 %6 to i32
  %rem27 = srem i32 %7, 160
  %conv28 = sitofp i32 %rem27 to double
  %arrayidx34 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv27, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %8 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv27
  %9 = trunc i64 %8 to i32
  %rem27.1 = srem i32 %9, 160
  %conv28.1 = sitofp i32 %rem27.1 to double
  %div30.v.i0.1 = insertelement <2 x double> undef, double %conv28, i32 0
  %div30.v.i0.2 = insertelement <2 x double> %div30.v.i0.1, double %conv28.1, i32 1
  %div30 = fdiv <2 x double> %div30.v.i0.2, <double 1.600000e+02, double 1.600000e+02>
  %10 = bitcast double* %arrayidx34 to <2 x double>*
  store <2 x double> %div30, <2 x double>* %10, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond.1, label %for.inc38, label %for.inc35.for.inc35_crit_edge

for.inc35.for.inc35_crit_edge:                    ; preds = %for.inc35
  br label %for.inc35

for.inc38:                                        ; preds = %for.inc35
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next28, 160
  br i1 %exitcond29, label %for.end40, label %for.inc38.for.cond22.preheader_crit_edge

for.inc38.for.cond22.preheader_crit_edge:         ; preds = %for.inc38
  br label %for.cond22.preheader

for.end40:                                        ; preds = %for.inc38
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([140 x [160 x double]]* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc21.for.cond2.preheader_crit_edge, %entry
  %indvars.iv21 = phi i64 [ 0, %entry ], [ %indvars.iv.next22, %for.inc21.for.cond2.preheader_crit_edge ]
  %3 = mul nuw nsw i64 %indvars.iv21, 140
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.inc18.for.cond5.preheader_crit_edge, %for.cond2.preheader
  %indvars.iv16 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next17, %for.inc18.for.cond5.preheader_crit_edge ]
  %4 = add nuw nsw i64 %indvars.iv16, %3
  %5 = mul nuw nsw i64 %4, 160
  br label %for.body7

for.body7:                                        ; preds = %for.inc.for.body7_crit_edge, %for.cond5.preheader
  %indvars.iv = phi i64 [ 0, %for.cond5.preheader ], [ %indvars.iv.next, %for.inc.for.body7_crit_edge ]
  %6 = add nuw nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %rem = srem i32 %7, 20
  %cmp11 = icmp eq i32 %rem, 0
  br i1 %cmp11, label %if.then, label %for.body7.for.inc_crit_edge

for.body7.for.inc_crit_edge:                      ; preds = %for.body7
  br label %for.inc

if.then:                                          ; preds = %for.body7
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %8) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body7.for.inc_crit_edge, %if.then
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv21, i64 %indvars.iv16, i64 %indvars.iv
  %10 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %10) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond, label %for.inc18, label %for.inc.for.body7_crit_edge

for.inc.for.body7_crit_edge:                      ; preds = %for.inc
  br label %for.body7

for.inc18:                                        ; preds = %for.inc
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next17, 140
  br i1 %exitcond20, label %for.inc21, label %for.inc18.for.cond5.preheader_crit_edge

for.inc18.for.cond5.preheader_crit_edge:          ; preds = %for.inc18
  br label %for.cond5.preheader

for.inc21:                                        ; preds = %for.inc18
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next22, 150
  br i1 %exitcond24, label %for.end23, label %for.inc21.for.cond2.preheader_crit_edge

for.inc21.for.cond2.preheader_crit_edge:          ; preds = %for.inc21
  br label %for.cond2.preheader

for.end23:                                        ; preds = %for.inc21
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %12) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
