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
  %0 = sext i32 %np to i64
  %1 = sext i32 %nq to i64
  %2 = sext i32 %nr to i64
  %cmp60 = icmp sgt i32 %nr, 0
  br i1 %cmp60, label %for.cond1.preheader.lr.ph, label %for.end44

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %wide.trip.count = zext i32 %np to i64
  %3 = shl nsw i64 %0, 3
  %4 = add nsw i64 %0, -1
  %5 = icmp sgt i32 %nq, 0
  %6 = icmp sgt i32 %np, 0
  %7 = icmp eq i32 %np, 0
  %8 = bitcast double* %sum to i8*
  %9 = icmp sgt i32 %np, 0
  %xtraiter78 = and i64 %0, 3
  %lcmp.mod79 = icmp eq i64 %xtraiter78, 0
  %10 = icmp ult i64 %4, 3
  %xtraiter76 = and i64 %wide.trip.count, 1
  %lcmp.mod77 = icmp eq i64 %xtraiter76, 0
  %11 = icmp eq i32 %np, 1
  %sunkaddr84 = ptrtoint double* %sum to i64
  %sunkaddr = ptrtoint double* %sum to i64
  %12 = icmp sgt i32 %np, 0
  %xtraiter = and i64 %0, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %13 = icmp ult i64 %4, 3
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc42, %for.cond1.preheader.lr.ph
  %indvars.iv2661 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next27, %for.inc42 ]
  br i1 %5, label %for.cond4.preheader.lr.ph, label %for.inc42

for.cond4.preheader.lr.ph:                        ; preds = %for.cond1.preheader
  br i1 %6, label %for.cond4.preheader.us.preheader, label %for.cond4.preheader.preheader

for.cond4.preheader.preheader:                    ; preds = %for.cond4.preheader.lr.ph
  br label %for.cond4.preheader

for.cond4.preheader.us.preheader:                 ; preds = %for.cond4.preheader.lr.ph
  br label %for.cond4.preheader.us

for.cond4.preheader.us:                           ; preds = %for.cond4.preheader.us.preheader, %for.inc39.us
  %indvars.iv2436.us = phi i64 [ %indvars.iv.next25.us, %for.inc39.us ], [ 0, %for.cond4.preheader.us.preheader ]
  br i1 %7, label %for.cond4.for.cond25.preheader_crit_edge.us.loopexit, label %for.body6.us40.preheader

for.body6.us40.preheader:                         ; preds = %for.cond4.preheader.us
  %arrayidx15.us45.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv2661, i64 %indvars.iv2436.us, i64 0
  br label %for.body6.us40

for.inc39.us.loopexit:                            ; preds = %for.inc36.us
  br label %for.inc39.us

for.inc39.us:                                     ; preds = %for.inc39.us.loopexit, %for.inc36.us.prol.loopexit, %for.cond4.for.cond25.preheader_crit_edge.us
  %indvars.iv.next25.us = add nuw nsw i64 %indvars.iv2436.us, 1
  %exitcond74 = icmp eq i64 %indvars.iv.next25.us, %1
  br i1 %exitcond74, label %for.inc42.loopexit, label %for.cond4.preheader.us

for.inc36.us:                                     ; preds = %for.inc36.us.preheader96, %for.inc36.us
  %indvars.iv2234.us = phi i64 [ %indvars.iv.next23.us.3, %for.inc36.us ], [ %indvars.iv2234.us.unr, %for.inc36.us.preheader96 ]
  %arrayidx29.us = getelementptr inbounds double, double* %sum, i64 %indvars.iv2234.us
  %14 = bitcast double* %arrayidx29.us to i64*
  %15 = load i64, i64* %14, align 8
  %arrayidx35.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv2661, i64 %indvars.iv2436.us, i64 %indvars.iv2234.us
  %16 = bitcast double* %arrayidx35.us to i64*
  store i64 %15, i64* %16, align 8
  %indvars.iv.next23.us = add nuw nsw i64 %indvars.iv2234.us, 1
  %arrayidx29.us.1 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next23.us
  %17 = bitcast double* %arrayidx29.us.1 to i64*
  %18 = load i64, i64* %17, align 8
  %arrayidx35.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv2661, i64 %indvars.iv2436.us, i64 %indvars.iv.next23.us
  %19 = bitcast double* %arrayidx35.us.1 to i64*
  store i64 %18, i64* %19, align 8
  %indvars.iv.next23.us.1 = add nsw i64 %indvars.iv2234.us, 2
  %arrayidx29.us.2 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next23.us.1
  %20 = bitcast double* %arrayidx29.us.2 to i64*
  %21 = load i64, i64* %20, align 8
  %arrayidx35.us.2 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv2661, i64 %indvars.iv2436.us, i64 %indvars.iv.next23.us.1
  %22 = bitcast double* %arrayidx35.us.2 to i64*
  store i64 %21, i64* %22, align 8
  %indvars.iv.next23.us.2 = add nsw i64 %indvars.iv2234.us, 3
  %arrayidx29.us.3 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next23.us.2
  %23 = bitcast double* %arrayidx29.us.3 to i64*
  %24 = load i64, i64* %23, align 8
  %arrayidx35.us.3 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv2661, i64 %indvars.iv2436.us, i64 %indvars.iv.next23.us.2
  %25 = bitcast double* %arrayidx35.us.3 to i64*
  store i64 %24, i64* %25, align 8
  %indvars.iv.next23.us.3 = add nsw i64 %indvars.iv2234.us, 4
  %exitcond72.3 = icmp eq i64 %indvars.iv.next23.us.3, %0
  br i1 %exitcond72.3, label %for.inc39.us.loopexit, label %for.inc36.us

for.body6.us40:                                   ; preds = %for.body6.us40.preheader, %for.cond7.for.inc22_crit_edge.us57
  %indvars.iv2031.us41 = phi i64 [ %indvars.iv.next21.us53, %for.cond7.for.inc22_crit_edge.us57 ], [ 0, %for.body6.us40.preheader ]
  %arrayidx.us42 = getelementptr inbounds double, double* %sum, i64 %indvars.iv2031.us41
  store double 0.000000e+00, double* %arrayidx.us42, align 8
  br i1 %lcmp.mod77, label %for.inc.us43.prol.loopexit, label %for.inc.us43.prol

for.inc.us43.prol:                                ; preds = %for.body6.us40
  %26 = load double, double* %arrayidx15.us45.prol, align 8
  %arrayidx19.us46.prol = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 0, i64 %indvars.iv2031.us41
  %27 = load double, double* %arrayidx19.us46.prol, align 8
  %mul.us47.prol = fmul double %26, %27
  %sunkaddr81 = shl i64 %indvars.iv2031.us41, 3
  %sunkaddr82 = add i64 %sunkaddr, %sunkaddr81
  %sunkaddr83 = inttoptr i64 %sunkaddr82 to double*
  %28 = load double, double* %sunkaddr83, align 8
  %add.us48.prol = fadd double %28, %mul.us47.prol
  store double %add.us48.prol, double* %sunkaddr83, align 8
  br label %for.inc.us43.prol.loopexit

for.inc.us43.prol.loopexit:                       ; preds = %for.inc.us43.prol, %for.body6.us40
  %indvars.iv29.us44.unr.ph = phi i64 [ 1, %for.inc.us43.prol ], [ 0, %for.body6.us40 ]
  br i1 %11, label %for.cond7.for.inc22_crit_edge.us57, label %for.inc.us43.preheader

for.inc.us43.preheader:                           ; preds = %for.inc.us43.prol.loopexit
  %sunkaddr85 = shl i64 %indvars.iv2031.us41, 3
  %sunkaddr86 = add i64 %sunkaddr84, %sunkaddr85
  %sunkaddr87 = inttoptr i64 %sunkaddr86 to double*
  br label %for.inc.us43

for.inc.us43:                                     ; preds = %for.inc.us43.preheader, %for.inc.us43
  %indvars.iv29.us44 = phi i64 [ %indvars.iv.next.us49.1, %for.inc.us43 ], [ %indvars.iv29.us44.unr.ph, %for.inc.us43.preheader ]
  %arrayidx15.us45 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv2661, i64 %indvars.iv2436.us, i64 %indvars.iv29.us44
  %29 = load double, double* %arrayidx15.us45, align 8
  %arrayidx19.us46 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv29.us44, i64 %indvars.iv2031.us41
  %30 = load double, double* %arrayidx19.us46, align 8
  %mul.us47 = fmul double %29, %30
  %31 = load double, double* %sunkaddr87, align 8
  %add.us48 = fadd double %31, %mul.us47
  store double %add.us48, double* %sunkaddr87, align 8
  %indvars.iv.next.us49 = add nuw nsw i64 %indvars.iv29.us44, 1
  %arrayidx15.us45.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv2661, i64 %indvars.iv2436.us, i64 %indvars.iv.next.us49
  %32 = load double, double* %arrayidx15.us45.1, align 8
  %arrayidx19.us46.1 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv.next.us49, i64 %indvars.iv2031.us41
  %33 = load double, double* %arrayidx19.us46.1, align 8
  %mul.us47.1 = fmul double %32, %33
  %34 = load double, double* %sunkaddr87, align 8
  %add.us48.1 = fadd double %34, %mul.us47.1
  store double %add.us48.1, double* %sunkaddr87, align 8
  %indvars.iv.next.us49.1 = add nsw i64 %indvars.iv29.us44, 2
  %exitcond.us50.1 = icmp eq i64 %indvars.iv.next.us49.1, %wide.trip.count
  br i1 %exitcond.us50.1, label %for.cond7.for.inc22_crit_edge.us57.loopexit, label %for.inc.us43

for.cond7.for.inc22_crit_edge.us57.loopexit:      ; preds = %for.inc.us43
  br label %for.cond7.for.inc22_crit_edge.us57

for.cond7.for.inc22_crit_edge.us57:               ; preds = %for.cond7.for.inc22_crit_edge.us57.loopexit, %for.inc.us43.prol.loopexit
  %indvars.iv.next21.us53 = add nuw nsw i64 %indvars.iv2031.us41, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next21.us53, %0
  br i1 %exitcond68, label %for.cond4.for.cond25.preheader_crit_edge.us.loopexit97, label %for.body6.us40

for.cond4.for.cond25.preheader_crit_edge.us.loopexit: ; preds = %for.cond4.preheader.us
  call void @llvm.memset.p0i8.i64(i8* %8, i8 0, i64 %3, i32 8, i1 false)
  br label %for.cond4.for.cond25.preheader_crit_edge.us

for.cond4.for.cond25.preheader_crit_edge.us.loopexit97: ; preds = %for.cond7.for.inc22_crit_edge.us57
  br label %for.cond4.for.cond25.preheader_crit_edge.us

for.cond4.for.cond25.preheader_crit_edge.us:      ; preds = %for.cond4.for.cond25.preheader_crit_edge.us.loopexit97, %for.cond4.for.cond25.preheader_crit_edge.us.loopexit
  br i1 %9, label %for.inc36.us.preheader, label %for.inc39.us

for.inc36.us.preheader:                           ; preds = %for.cond4.for.cond25.preheader_crit_edge.us
  br i1 %lcmp.mod79, label %for.inc36.us.prol.loopexit, label %for.inc36.us.prol.preheader

for.inc36.us.prol.preheader:                      ; preds = %for.inc36.us.preheader
  br label %for.inc36.us.prol

for.inc36.us.prol:                                ; preds = %for.inc36.us.prol.preheader, %for.inc36.us.prol
  %indvars.iv2234.us.prol = phi i64 [ %indvars.iv.next23.us.prol, %for.inc36.us.prol ], [ 0, %for.inc36.us.prol.preheader ]
  %prol.iter80 = phi i64 [ %prol.iter80.sub, %for.inc36.us.prol ], [ %xtraiter78, %for.inc36.us.prol.preheader ]
  %arrayidx29.us.prol = getelementptr inbounds double, double* %sum, i64 %indvars.iv2234.us.prol
  %35 = bitcast double* %arrayidx29.us.prol to i64*
  %36 = load i64, i64* %35, align 8
  %arrayidx35.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv2661, i64 %indvars.iv2436.us, i64 %indvars.iv2234.us.prol
  %37 = bitcast double* %arrayidx35.us.prol to i64*
  store i64 %36, i64* %37, align 8
  %indvars.iv.next23.us.prol = add nuw nsw i64 %indvars.iv2234.us.prol, 1
  %prol.iter80.sub = add i64 %prol.iter80, -1
  %prol.iter80.cmp = icmp eq i64 %prol.iter80.sub, 0
  br i1 %prol.iter80.cmp, label %for.inc36.us.prol.loopexit.loopexit, label %for.inc36.us.prol, !llvm.loop !1

for.inc36.us.prol.loopexit.loopexit:              ; preds = %for.inc36.us.prol
  br label %for.inc36.us.prol.loopexit

for.inc36.us.prol.loopexit:                       ; preds = %for.inc36.us.prol.loopexit.loopexit, %for.inc36.us.preheader
  %indvars.iv2234.us.unr = phi i64 [ 0, %for.inc36.us.preheader ], [ %indvars.iv.next23.us.prol, %for.inc36.us.prol.loopexit.loopexit ]
  br i1 %10, label %for.inc39.us, label %for.inc36.us.preheader96

for.inc36.us.preheader96:                         ; preds = %for.inc36.us.prol.loopexit
  br label %for.inc36.us

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.inc39
  %indvars.iv2436 = phi i64 [ %indvars.iv.next25, %for.inc39 ], [ 0, %for.cond4.preheader.preheader ]
  br i1 %12, label %for.inc36.preheader, label %for.inc39

for.inc36.preheader:                              ; preds = %for.cond4.preheader
  br i1 %lcmp.mod, label %for.inc36.prol.loopexit, label %for.inc36.prol.preheader

for.inc36.prol.preheader:                         ; preds = %for.inc36.preheader
  br label %for.inc36.prol

for.inc36.prol:                                   ; preds = %for.inc36.prol.preheader, %for.inc36.prol
  %indvars.iv2234.prol = phi i64 [ %indvars.iv.next23.prol, %for.inc36.prol ], [ 0, %for.inc36.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc36.prol ], [ %xtraiter, %for.inc36.prol.preheader ]
  %arrayidx29.prol = getelementptr inbounds double, double* %sum, i64 %indvars.iv2234.prol
  %38 = bitcast double* %arrayidx29.prol to i64*
  %39 = load i64, i64* %38, align 8
  %arrayidx35.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv2661, i64 %indvars.iv2436, i64 %indvars.iv2234.prol
  %40 = bitcast double* %arrayidx35.prol to i64*
  store i64 %39, i64* %40, align 8
  %indvars.iv.next23.prol = add nuw nsw i64 %indvars.iv2234.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc36.prol.loopexit.loopexit, label %for.inc36.prol, !llvm.loop !3

for.inc36.prol.loopexit.loopexit:                 ; preds = %for.inc36.prol
  br label %for.inc36.prol.loopexit

for.inc36.prol.loopexit:                          ; preds = %for.inc36.prol.loopexit.loopexit, %for.inc36.preheader
  %indvars.iv2234.unr = phi i64 [ 0, %for.inc36.preheader ], [ %indvars.iv.next23.prol, %for.inc36.prol.loopexit.loopexit ]
  br i1 %13, label %for.inc39, label %for.inc36.preheader98

for.inc36.preheader98:                            ; preds = %for.inc36.prol.loopexit
  br label %for.inc36

for.inc36:                                        ; preds = %for.inc36.preheader98, %for.inc36
  %indvars.iv2234 = phi i64 [ %indvars.iv.next23.3, %for.inc36 ], [ %indvars.iv2234.unr, %for.inc36.preheader98 ]
  %arrayidx29 = getelementptr inbounds double, double* %sum, i64 %indvars.iv2234
  %41 = bitcast double* %arrayidx29 to i64*
  %42 = load i64, i64* %41, align 8
  %arrayidx35 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv2661, i64 %indvars.iv2436, i64 %indvars.iv2234
  %43 = bitcast double* %arrayidx35 to i64*
  store i64 %42, i64* %43, align 8
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv2234, 1
  %arrayidx29.1 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next23
  %44 = bitcast double* %arrayidx29.1 to i64*
  %45 = load i64, i64* %44, align 8
  %arrayidx35.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv2661, i64 %indvars.iv2436, i64 %indvars.iv.next23
  %46 = bitcast double* %arrayidx35.1 to i64*
  store i64 %45, i64* %46, align 8
  %indvars.iv.next23.1 = add nsw i64 %indvars.iv2234, 2
  %arrayidx29.2 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next23.1
  %47 = bitcast double* %arrayidx29.2 to i64*
  %48 = load i64, i64* %47, align 8
  %arrayidx35.2 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv2661, i64 %indvars.iv2436, i64 %indvars.iv.next23.1
  %49 = bitcast double* %arrayidx35.2 to i64*
  store i64 %48, i64* %49, align 8
  %indvars.iv.next23.2 = add nsw i64 %indvars.iv2234, 3
  %arrayidx29.3 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next23.2
  %50 = bitcast double* %arrayidx29.3 to i64*
  %51 = load i64, i64* %50, align 8
  %arrayidx35.3 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv2661, i64 %indvars.iv2436, i64 %indvars.iv.next23.2
  %52 = bitcast double* %arrayidx35.3 to i64*
  store i64 %51, i64* %52, align 8
  %indvars.iv.next23.3 = add nsw i64 %indvars.iv2234, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next23.3, %0
  br i1 %exitcond.3, label %for.inc39.loopexit, label %for.inc36

for.inc39.loopexit:                               ; preds = %for.inc36
  br label %for.inc39

for.inc39:                                        ; preds = %for.inc39.loopexit, %for.inc36.prol.loopexit, %for.cond4.preheader
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv2436, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next25, %1
  br i1 %exitcond67, label %for.inc42.loopexit99, label %for.cond4.preheader

for.inc42.loopexit:                               ; preds = %for.inc39.us
  br label %for.inc42

for.inc42.loopexit99:                             ; preds = %for.inc39
  br label %for.inc42

for.inc42:                                        ; preds = %for.inc42.loopexit99, %for.inc42.loopexit, %for.cond1.preheader
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv2661, 1
  %exitcond75 = icmp eq i64 %indvars.iv.next27, %2
  br i1 %exitcond75, label %for.end44.loopexit, label %for.cond1.preheader

for.end44.loopexit:                               ; preds = %for.inc42
  br label %for.end44

for.end44:                                        ; preds = %for.end44.loopexit, %entry
  ret void
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
  %arraydecay4 = bitcast i8* %call to [140 x [160 x double]]*
  %arraydecay5 = bitcast i8* %call2 to [160 x double]*
  %arraydecay6 = bitcast i8* %call1 to double*
  tail call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %arraydecay4, [160 x double]* %arraydecay5, double* %arraydecay6)
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
  %arraydecay8 = bitcast i8* %call to [140 x [160 x double]]*
  tail call fastcc void @print_array([140 x [160 x double]]* %arraydecay8)
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
  %indvars.iv3036 = phi i64 [ 0, %entry ], [ %indvars.iv.next31, %for.inc15 ]
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.inc12, %for.cond1.preheader
  %indvars.iv2735 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next28, %for.inc12 ]
  %0 = mul nuw nsw i64 %indvars.iv2735, %indvars.iv3036
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.cond4.preheader
  %indvars.iv2434 = phi i64 [ 0, %for.cond4.preheader ], [ %indvars.iv.next25.1, %for.inc ]
  %1 = add nuw nsw i64 %indvars.iv2434, %0
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 160
  %conv = sitofp i32 %rem to double
  %arrayidx11 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv3036, i64 %indvars.iv2735, i64 %indvars.iv2434
  %indvars.iv.next25 = or i64 %indvars.iv2434, 1
  %3 = add nuw nsw i64 %indvars.iv.next25, %0
  %4 = trunc i64 %3 to i32
  %rem.1 = srem i32 %4, 160
  %conv.1 = sitofp i32 %rem.1 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 1.600000e+02, double 1.600000e+02>
  %5 = bitcast double* %arrayidx11 to <2 x double>*
  store <2 x double> %div, <2 x double>* %5, align 8
  %indvars.iv.next25.1 = add nsw i64 %indvars.iv2434, 2
  %exitcond38.1 = icmp eq i64 %indvars.iv.next25.1, 160
  br i1 %exitcond38.1, label %for.inc12, label %for.inc

for.inc12:                                        ; preds = %for.inc
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv2735, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next28, 140
  br i1 %exitcond39, label %for.inc15, label %for.cond4.preheader

for.inc15:                                        ; preds = %for.inc12
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv3036, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next31, 150
  br i1 %exitcond40, label %for.cond22.preheader.preheader, label %for.cond1.preheader

for.cond22.preheader.preheader:                   ; preds = %for.inc15
  br label %for.cond22.preheader

for.cond22.preheader:                             ; preds = %for.cond22.preheader.preheader, %for.inc38
  %indvars.iv2233 = phi i64 [ %indvars.iv.next23, %for.inc38 ], [ 0, %for.cond22.preheader.preheader ]
  br label %for.inc35

for.inc35:                                        ; preds = %for.inc35, %for.cond22.preheader
  %indvars.iv32 = phi i64 [ 0, %for.cond22.preheader ], [ %indvars.iv.next.1, %for.inc35 ]
  %6 = mul nuw nsw i64 %indvars.iv32, %indvars.iv2233
  %7 = trunc i64 %6 to i32
  %rem27 = srem i32 %7, 160
  %conv28 = sitofp i32 %rem27 to double
  %arrayidx34 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv2233, i64 %indvars.iv32
  %indvars.iv.next = or i64 %indvars.iv32, 1
  %8 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv2233
  %9 = trunc i64 %8 to i32
  %rem27.1 = srem i32 %9, 160
  %conv28.1 = sitofp i32 %rem27.1 to double
  %div30.v.i0.1 = insertelement <2 x double> undef, double %conv28, i32 0
  %div30.v.i0.2 = insertelement <2 x double> %div30.v.i0.1, double %conv28.1, i32 1
  %div30 = fdiv <2 x double> %div30.v.i0.2, <double 1.600000e+02, double 1.600000e+02>
  %10 = bitcast double* %arrayidx34 to <2 x double>*
  store <2 x double> %div30, <2 x double>* %10, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv32, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond.1, label %for.inc38, label %for.inc35

for.inc38:                                        ; preds = %for.inc35
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv2233, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next23, 160
  br i1 %exitcond37, label %for.end40, label %for.cond22.preheader

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
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc21, %entry
  %indvars.iv1520 = phi i64 [ 0, %entry ], [ %indvars.iv.next16, %for.inc21 ]
  %3 = mul nuw nsw i64 %indvars.iv1520, 140
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.inc18, %for.cond2.preheader
  %indvars.iv1319 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next14, %for.inc18 ]
  %mul83 = add nuw nsw i64 %indvars.iv1319, %3
  %add = mul nuw nsw i64 %mul83, 160
  br label %for.body7

for.body7:                                        ; preds = %for.inc, %for.cond5.preheader
  %indvars.iv18 = phi i64 [ 0, %for.cond5.preheader ], [ %indvars.iv.next, %for.inc ]
  %4 = add nuw nsw i64 %indvars.iv18, %add
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp11 = icmp eq i32 %rem, 0
  br i1 %cmp11, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body7
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body7, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv1520, i64 %indvars.iv1319, i64 %indvars.iv18
  %8 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv18, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond, label %for.inc18, label %for.body7

for.inc18:                                        ; preds = %for.inc
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv1319, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next14, 140
  br i1 %exitcond21, label %for.inc21, label %for.cond5.preheader

for.inc21:                                        ; preds = %for.inc18
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv1520, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next16, 150
  br i1 %exitcond22, label %for.end23, label %for.cond2.preheader

for.end23:                                        ; preds = %for.inc21
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
