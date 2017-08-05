; ModuleID = 'A.ll'
source_filename = "doitgen.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline norecurse nounwind uwtable
define void @kernel_doitgen(i32 %nr, i32 %nq, i32 %np, [140 x [160 x double]]* nocapture %A, [160 x double]* nocapture readonly %C4, double* nocapture %sum) local_unnamed_addr #0 {
entry:
  %sum52 = bitcast double* %sum to i8*
  %0 = sext i32 %np to i64
  %1 = sext i32 %nq to i64
  %2 = sext i32 %nr to i64
  %cmp40 = icmp sgt i32 %nr, 0
  br i1 %cmp40, label %for.cond1.preheader.lr.ph, label %for.end44

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp216 = icmp sgt i32 %nq, 0
  %cmp511 = icmp sgt i32 %np, 0
  %wide.trip.count = zext i32 %np to i64
  %exitcond9 = icmp eq i32 %np, 0
  %cmp2614 = icmp sgt i32 %np, 0
  %3 = add nsw i64 %0, -1
  %4 = shl nsw i64 %0, 3
  %xtraiter55 = and i64 %0, 3
  %lcmp.mod56 = icmp eq i64 %xtraiter55, 0
  %5 = icmp ult i64 %3, 3
  %xtraiter47 = and i64 %wide.trip.count, 1
  %lcmp.mod48 = icmp eq i64 %xtraiter47, 0
  %6 = icmp eq i32 %np, 1
  %xtraiter = and i64 %0, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %7 = icmp ult i64 %3, 3
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc42, %for.cond1.preheader.lr.ph
  %indvars.iv741 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next8, %for.inc42 ]
  br i1 %cmp216, label %for.cond4.preheader.lr.ph, label %for.inc42

for.cond4.preheader.lr.ph:                        ; preds = %for.cond1.preheader
  br i1 %cmp511, label %for.cond4.preheader.us.preheader, label %for.cond4.preheader.preheader

for.cond4.preheader.preheader:                    ; preds = %for.cond4.preheader.lr.ph
  br label %for.cond4.preheader

for.cond4.preheader.us.preheader:                 ; preds = %for.cond4.preheader.lr.ph
  br label %for.cond4.preheader.us

for.cond4.preheader.us:                           ; preds = %for.cond4.preheader.us.preheader, %for.inc39.us
  %indvars.iv517.us = phi i64 [ %indvars.iv.next6.us, %for.inc39.us ], [ 0, %for.cond4.preheader.us.preheader ]
  br i1 %exitcond9, label %for.cond4.for.cond25.preheader_crit_edge.us.loopexit, label %for.body6.us21.preheader

for.body6.us21.preheader:                         ; preds = %for.cond4.preheader.us
  %arrayidx15.us26.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv741, i64 %indvars.iv517.us, i64 0
  br label %for.body6.us21

for.inc39.us.loopexit:                            ; preds = %for.body27.us
  br label %for.inc39.us

for.inc39.us:                                     ; preds = %for.inc39.us.loopexit, %for.body27.us.prol.loopexit, %for.cond4.for.cond25.preheader_crit_edge.us
  %indvars.iv.next6.us = add nuw nsw i64 %indvars.iv517.us, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next6.us, %1
  br i1 %exitcond58, label %for.inc42.loopexit, label %for.cond4.preheader.us

for.body27.us:                                    ; preds = %for.body27.us.preheader68, %for.body27.us
  %indvars.iv315.us = phi i64 [ %indvars.iv.next4.us.3, %for.body27.us ], [ %indvars.iv315.us.unr, %for.body27.us.preheader68 ]
  %arrayidx29.us = getelementptr inbounds double, double* %sum, i64 %indvars.iv315.us
  %8 = bitcast double* %arrayidx29.us to i64*
  %9 = load i64, i64* %8, align 8
  %arrayidx35.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv741, i64 %indvars.iv517.us, i64 %indvars.iv315.us
  %10 = bitcast double* %arrayidx35.us to i64*
  store i64 %9, i64* %10, align 8
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv315.us, 1
  %arrayidx29.us.1 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next4.us
  %11 = bitcast double* %arrayidx29.us.1 to i64*
  %12 = load i64, i64* %11, align 8
  %arrayidx35.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv741, i64 %indvars.iv517.us, i64 %indvars.iv.next4.us
  %13 = bitcast double* %arrayidx35.us.1 to i64*
  store i64 %12, i64* %13, align 8
  %indvars.iv.next4.us.1 = add nsw i64 %indvars.iv315.us, 2
  %arrayidx29.us.2 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next4.us.1
  %14 = bitcast double* %arrayidx29.us.2 to i64*
  %15 = load i64, i64* %14, align 8
  %arrayidx35.us.2 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv741, i64 %indvars.iv517.us, i64 %indvars.iv.next4.us.1
  %16 = bitcast double* %arrayidx35.us.2 to i64*
  store i64 %15, i64* %16, align 8
  %indvars.iv.next4.us.2 = add nsw i64 %indvars.iv315.us, 3
  %arrayidx29.us.3 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next4.us.2
  %17 = bitcast double* %arrayidx29.us.3 to i64*
  %18 = load i64, i64* %17, align 8
  %arrayidx35.us.3 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv741, i64 %indvars.iv517.us, i64 %indvars.iv.next4.us.2
  %19 = bitcast double* %arrayidx35.us.3 to i64*
  store i64 %18, i64* %19, align 8
  %indvars.iv.next4.us.3 = add nsw i64 %indvars.iv315.us, 4
  %exitcond53.3 = icmp eq i64 %indvars.iv.next4.us.3, %0
  br i1 %exitcond53.3, label %for.inc39.us.loopexit, label %for.body27.us

for.body6.us21:                                   ; preds = %for.body6.us21.preheader, %for.cond7.for.inc22_crit_edge.us37
  %indvars.iv112.us22 = phi i64 [ %indvars.iv.next2.us34, %for.cond7.for.inc22_crit_edge.us37 ], [ 0, %for.body6.us21.preheader ]
  %arrayidx.us23 = getelementptr inbounds double, double* %sum, i64 %indvars.iv112.us22
  store double 0.000000e+00, double* %arrayidx.us23, align 8
  br i1 %lcmp.mod48, label %for.body9.us24.prol.loopexit, label %for.body9.us24.prol

for.body9.us24.prol:                              ; preds = %for.body6.us21
  %20 = load double, double* %arrayidx15.us26.prol, align 8
  %arrayidx19.us27.prol = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 0, i64 %indvars.iv112.us22
  %21 = load double, double* %arrayidx19.us27.prol, align 8
  %mul.us28.prol = fmul double %20, %21
  %22 = load double, double* %arrayidx.us23, align 8
  %add.us29.prol = fadd double %22, %mul.us28.prol
  store double %add.us29.prol, double* %arrayidx.us23, align 8
  br label %for.body9.us24.prol.loopexit

for.body9.us24.prol.loopexit:                     ; preds = %for.body9.us24.prol, %for.body6.us21
  %indvars.iv10.us25.unr.ph = phi i64 [ 1, %for.body9.us24.prol ], [ 0, %for.body6.us21 ]
  br i1 %6, label %for.cond7.for.inc22_crit_edge.us37, label %for.body9.us24.preheader

for.body9.us24.preheader:                         ; preds = %for.body9.us24.prol.loopexit
  br label %for.body9.us24

for.body9.us24:                                   ; preds = %for.body9.us24.preheader, %for.body9.us24
  %indvars.iv10.us25 = phi i64 [ %indvars.iv.next.us30.1, %for.body9.us24 ], [ %indvars.iv10.us25.unr.ph, %for.body9.us24.preheader ]
  %arrayidx15.us26 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv741, i64 %indvars.iv517.us, i64 %indvars.iv10.us25
  %23 = load double, double* %arrayidx15.us26, align 8
  %arrayidx19.us27 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv10.us25, i64 %indvars.iv112.us22
  %24 = load double, double* %arrayidx19.us27, align 8
  %mul.us28 = fmul double %23, %24
  %25 = load double, double* %arrayidx.us23, align 8
  %add.us29 = fadd double %25, %mul.us28
  store double %add.us29, double* %arrayidx.us23, align 8
  %indvars.iv.next.us30 = add nuw nsw i64 %indvars.iv10.us25, 1
  %arrayidx15.us26.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv741, i64 %indvars.iv517.us, i64 %indvars.iv.next.us30
  %26 = load double, double* %arrayidx15.us26.1, align 8
  %arrayidx19.us27.1 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv.next.us30, i64 %indvars.iv112.us22
  %27 = load double, double* %arrayidx19.us27.1, align 8
  %mul.us28.1 = fmul double %26, %27
  %28 = load double, double* %arrayidx.us23, align 8
  %add.us29.1 = fadd double %28, %mul.us28.1
  store double %add.us29.1, double* %arrayidx.us23, align 8
  %indvars.iv.next.us30.1 = add nsw i64 %indvars.iv10.us25, 2
  %exitcond.us31.1 = icmp eq i64 %indvars.iv.next.us30.1, %wide.trip.count
  br i1 %exitcond.us31.1, label %for.cond7.for.inc22_crit_edge.us37.loopexit, label %for.body9.us24

for.cond7.for.inc22_crit_edge.us37.loopexit:      ; preds = %for.body9.us24
  br label %for.cond7.for.inc22_crit_edge.us37

for.cond7.for.inc22_crit_edge.us37:               ; preds = %for.cond7.for.inc22_crit_edge.us37.loopexit, %for.body9.us24.prol.loopexit
  %indvars.iv.next2.us34 = add nuw nsw i64 %indvars.iv112.us22, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next2.us34, %0
  br i1 %exitcond49, label %for.cond4.for.cond25.preheader_crit_edge.us.loopexit69, label %for.body6.us21

for.cond4.for.cond25.preheader_crit_edge.us.loopexit: ; preds = %for.cond4.preheader.us
  call void @llvm.memset.p0i8.i64(i8* %sum52, i8 0, i64 %4, i32 8, i1 false)
  br label %for.cond4.for.cond25.preheader_crit_edge.us

for.cond4.for.cond25.preheader_crit_edge.us.loopexit69: ; preds = %for.cond7.for.inc22_crit_edge.us37
  br label %for.cond4.for.cond25.preheader_crit_edge.us

for.cond4.for.cond25.preheader_crit_edge.us:      ; preds = %for.cond4.for.cond25.preheader_crit_edge.us.loopexit69, %for.cond4.for.cond25.preheader_crit_edge.us.loopexit
  br i1 %cmp2614, label %for.body27.us.preheader, label %for.inc39.us

for.body27.us.preheader:                          ; preds = %for.cond4.for.cond25.preheader_crit_edge.us
  br i1 %lcmp.mod56, label %for.body27.us.prol.loopexit, label %for.body27.us.prol.preheader

for.body27.us.prol.preheader:                     ; preds = %for.body27.us.preheader
  br label %for.body27.us.prol

for.body27.us.prol:                               ; preds = %for.body27.us.prol.preheader, %for.body27.us.prol
  %indvars.iv315.us.prol = phi i64 [ %indvars.iv.next4.us.prol, %for.body27.us.prol ], [ 0, %for.body27.us.prol.preheader ]
  %prol.iter57 = phi i64 [ %prol.iter57.sub, %for.body27.us.prol ], [ %xtraiter55, %for.body27.us.prol.preheader ]
  %arrayidx29.us.prol = getelementptr inbounds double, double* %sum, i64 %indvars.iv315.us.prol
  %29 = bitcast double* %arrayidx29.us.prol to i64*
  %30 = load i64, i64* %29, align 8
  %arrayidx35.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv741, i64 %indvars.iv517.us, i64 %indvars.iv315.us.prol
  %31 = bitcast double* %arrayidx35.us.prol to i64*
  store i64 %30, i64* %31, align 8
  %indvars.iv.next4.us.prol = add nuw nsw i64 %indvars.iv315.us.prol, 1
  %prol.iter57.sub = add i64 %prol.iter57, -1
  %prol.iter57.cmp = icmp eq i64 %prol.iter57.sub, 0
  br i1 %prol.iter57.cmp, label %for.body27.us.prol.loopexit.loopexit, label %for.body27.us.prol, !llvm.loop !1

for.body27.us.prol.loopexit.loopexit:             ; preds = %for.body27.us.prol
  br label %for.body27.us.prol.loopexit

for.body27.us.prol.loopexit:                      ; preds = %for.body27.us.prol.loopexit.loopexit, %for.body27.us.preheader
  %indvars.iv315.us.unr = phi i64 [ 0, %for.body27.us.preheader ], [ %indvars.iv.next4.us.prol, %for.body27.us.prol.loopexit.loopexit ]
  br i1 %5, label %for.inc39.us, label %for.body27.us.preheader68

for.body27.us.preheader68:                        ; preds = %for.body27.us.prol.loopexit
  br label %for.body27.us

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.inc39
  %indvars.iv517 = phi i64 [ %indvars.iv.next6, %for.inc39 ], [ 0, %for.cond4.preheader.preheader ]
  br i1 %cmp2614, label %for.body27.preheader, label %for.inc39

for.body27.preheader:                             ; preds = %for.cond4.preheader
  br i1 %lcmp.mod, label %for.body27.prol.loopexit, label %for.body27.prol.preheader

for.body27.prol.preheader:                        ; preds = %for.body27.preheader
  br label %for.body27.prol

for.body27.prol:                                  ; preds = %for.body27.prol.preheader, %for.body27.prol
  %indvars.iv315.prol = phi i64 [ %indvars.iv.next4.prol, %for.body27.prol ], [ 0, %for.body27.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body27.prol ], [ %xtraiter, %for.body27.prol.preheader ]
  %arrayidx29.prol = getelementptr inbounds double, double* %sum, i64 %indvars.iv315.prol
  %32 = bitcast double* %arrayidx29.prol to i64*
  %33 = load i64, i64* %32, align 8
  %arrayidx35.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv741, i64 %indvars.iv517, i64 %indvars.iv315.prol
  %34 = bitcast double* %arrayidx35.prol to i64*
  store i64 %33, i64* %34, align 8
  %indvars.iv.next4.prol = add nuw nsw i64 %indvars.iv315.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body27.prol.loopexit.loopexit, label %for.body27.prol, !llvm.loop !3

for.body27.prol.loopexit.loopexit:                ; preds = %for.body27.prol
  br label %for.body27.prol.loopexit

for.body27.prol.loopexit:                         ; preds = %for.body27.prol.loopexit.loopexit, %for.body27.preheader
  %indvars.iv315.unr = phi i64 [ 0, %for.body27.preheader ], [ %indvars.iv.next4.prol, %for.body27.prol.loopexit.loopexit ]
  br i1 %7, label %for.inc39, label %for.body27.preheader70

for.body27.preheader70:                           ; preds = %for.body27.prol.loopexit
  br label %for.body27

for.body27:                                       ; preds = %for.body27.preheader70, %for.body27
  %indvars.iv315 = phi i64 [ %indvars.iv.next4.3, %for.body27 ], [ %indvars.iv315.unr, %for.body27.preheader70 ]
  %arrayidx29 = getelementptr inbounds double, double* %sum, i64 %indvars.iv315
  %35 = bitcast double* %arrayidx29 to i64*
  %36 = load i64, i64* %35, align 8
  %arrayidx35 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv741, i64 %indvars.iv517, i64 %indvars.iv315
  %37 = bitcast double* %arrayidx35 to i64*
  store i64 %36, i64* %37, align 8
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv315, 1
  %arrayidx29.1 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next4
  %38 = bitcast double* %arrayidx29.1 to i64*
  %39 = load i64, i64* %38, align 8
  %arrayidx35.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv741, i64 %indvars.iv517, i64 %indvars.iv.next4
  %40 = bitcast double* %arrayidx35.1 to i64*
  store i64 %39, i64* %40, align 8
  %indvars.iv.next4.1 = add nsw i64 %indvars.iv315, 2
  %arrayidx29.2 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next4.1
  %41 = bitcast double* %arrayidx29.2 to i64*
  %42 = load i64, i64* %41, align 8
  %arrayidx35.2 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv741, i64 %indvars.iv517, i64 %indvars.iv.next4.1
  %43 = bitcast double* %arrayidx35.2 to i64*
  store i64 %42, i64* %43, align 8
  %indvars.iv.next4.2 = add nsw i64 %indvars.iv315, 3
  %arrayidx29.3 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next4.2
  %44 = bitcast double* %arrayidx29.3 to i64*
  %45 = load i64, i64* %44, align 8
  %arrayidx35.3 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv741, i64 %indvars.iv517, i64 %indvars.iv.next4.2
  %46 = bitcast double* %arrayidx35.3 to i64*
  store i64 %45, i64* %46, align 8
  %indvars.iv.next4.3 = add nsw i64 %indvars.iv315, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next4.3, %0
  br i1 %exitcond.3, label %for.inc39.loopexit, label %for.body27

for.inc39.loopexit:                               ; preds = %for.body27
  br label %for.inc39

for.inc39:                                        ; preds = %for.inc39.loopexit, %for.body27.prol.loopexit, %for.cond4.preheader
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv517, 1
  %exitcond = icmp eq i64 %indvars.iv.next6, %1
  br i1 %exitcond, label %for.inc42.loopexit71, label %for.cond4.preheader

for.inc42.loopexit:                               ; preds = %for.inc39.us
  br label %for.inc42

for.inc42.loopexit71:                             ; preds = %for.inc39
  br label %for.inc42

for.inc42:                                        ; preds = %for.inc42.loopexit71, %for.inc42.loopexit, %for.cond1.preheader
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv741, 1
  %exitcond59 = icmp eq i64 %indvars.iv.next8, %2
  br i1 %exitcond59, label %for.end44.loopexit, label %for.cond1.preheader

for.end44.loopexit:                               ; preds = %for.inc42
  br label %for.end44

for.end44:                                        ; preds = %for.end44.loopexit, %entry
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #1 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %arraydecay = bitcast i8* %call to [140 x [160 x double]]*
  %arraydecay3 = bitcast i8* %call2 to [160 x double]*
  tail call fastcc void @init_array([140 x [160 x double]]* %arraydecay, [160 x double]* %arraydecay3)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay6 = bitcast i8* %call1 to double*
  tail call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %arraydecay, [160 x double]* %arraydecay3, double* %arraydecay6)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
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
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([140 x [160 x double]]* nocapture %A, [160 x double]* nocapture %C4) unnamed_addr #0 {
for.cond1.preheader.us.preheader:
  br label %for.cond4.preheader.us.us.preheader

for.cond4.preheader.us.us.preheader:              ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.inc15_crit_edge.us
  %indvars.iv1023.us = phi i64 [ %indvars.iv.next11.us, %for.cond1.for.inc15_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  br label %for.cond4.preheader.us.us.new

for.cond1.for.inc15_crit_edge.us:                 ; preds = %for.cond4.for.inc12_crit_edge.us.us
  %indvars.iv.next11.us = add nuw nsw i64 %indvars.iv1023.us, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next11.us, 150
  br i1 %exitcond52, label %for.cond22.preheader.new.preheader, label %for.cond4.preheader.us.us.preheader

for.cond22.preheader.new.preheader:               ; preds = %for.cond1.for.inc15_crit_edge.us
  br label %for.cond22.preheader.new

for.cond4.preheader.us.us.new:                    ; preds = %for.cond4.preheader.us.us.preheader, %for.cond4.for.inc12_crit_edge.us.us
  %indvars.iv720.us.us = phi i64 [ %indvars.iv.next8.us.us, %for.cond4.for.inc12_crit_edge.us.us ], [ 0, %for.cond4.preheader.us.us.preheader ]
  %0 = mul nuw nsw i64 %indvars.iv720.us.us, %indvars.iv1023.us
  br label %for.body6.us.us

for.cond4.for.inc12_crit_edge.us.us:              ; preds = %for.body6.us.us
  %indvars.iv.next8.us.us = add nuw nsw i64 %indvars.iv720.us.us, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next8.us.us, 140
  br i1 %exitcond51, label %for.cond1.for.inc15_crit_edge.us, label %for.cond4.preheader.us.us.new

for.body6.us.us:                                  ; preds = %for.body6.us.us, %for.cond4.preheader.us.us.new
  %indvars.iv418.us.us = phi i64 [ 0, %for.cond4.preheader.us.us.new ], [ %indvars.iv.next5.us.us.1, %for.body6.us.us ]
  %1 = add nuw nsw i64 %indvars.iv418.us.us, %0
  %2 = trunc i64 %1 to i32
  %rem.us.us = srem i32 %2, 160
  %conv.us.us = sitofp i32 %rem.us.us to double
  %div.us.us = fdiv double %conv.us.us, 1.600000e+02
  %arrayidx11.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv1023.us, i64 %indvars.iv720.us.us, i64 %indvars.iv418.us.us
  store double %div.us.us, double* %arrayidx11.us.us, align 8
  %indvars.iv.next5.us.us = or i64 %indvars.iv418.us.us, 1
  %3 = add nuw nsw i64 %indvars.iv.next5.us.us, %0
  %4 = trunc i64 %3 to i32
  %rem.us.us.1 = srem i32 %4, 160
  %conv.us.us.1 = sitofp i32 %rem.us.us.1 to double
  %div.us.us.1 = fdiv double %conv.us.us.1, 1.600000e+02
  %arrayidx11.us.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv1023.us, i64 %indvars.iv720.us.us, i64 %indvars.iv.next5.us.us
  store double %div.us.us.1, double* %arrayidx11.us.us.1, align 8
  %indvars.iv.next5.us.us.1 = add nsw i64 %indvars.iv418.us.us, 2
  %exitcond48.1 = icmp eq i64 %indvars.iv.next5.us.us.1, 160
  br i1 %exitcond48.1, label %for.cond4.for.inc12_crit_edge.us.us, label %for.body6.us.us

for.cond22.preheader.new:                         ; preds = %for.cond22.preheader.new.preheader, %for.inc38
  %indvars.iv215 = phi i64 [ %indvars.iv.next3, %for.inc38 ], [ 0, %for.cond22.preheader.new.preheader ]
  br label %for.body25

for.body25:                                       ; preds = %for.body25, %for.cond22.preheader.new
  %indvars.iv13 = phi i64 [ 0, %for.cond22.preheader.new ], [ %indvars.iv.next.1, %for.body25 ]
  %5 = mul nuw nsw i64 %indvars.iv13, %indvars.iv215
  %6 = trunc i64 %5 to i32
  %rem27 = srem i32 %6, 160
  %conv28 = sitofp i32 %rem27 to double
  %div30 = fdiv double %conv28, 1.600000e+02
  %arrayidx34 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv215, i64 %indvars.iv13
  store double %div30, double* %arrayidx34, align 8
  %indvars.iv.next = or i64 %indvars.iv13, 1
  %7 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv215
  %8 = trunc i64 %7 to i32
  %rem27.1 = srem i32 %8, 160
  %conv28.1 = sitofp i32 %rem27.1 to double
  %div30.1 = fdiv double %conv28.1, 1.600000e+02
  %arrayidx34.1 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv215, i64 %indvars.iv.next
  store double %div30.1, double* %arrayidx34.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv13, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond.1, label %for.inc38, label %for.body25

for.inc38:                                        ; preds = %for.body25
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv215, 1
  %exitcond = icmp eq i64 %indvars.iv.next3, 160
  br i1 %exitcond, label %for.end40, label %for.cond22.preheader.new

for.end40:                                        ; preds = %for.inc38
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([140 x [160 x double]]* nocapture readonly %A) unnamed_addr #1 {
for.cond2.preheader.us.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond5.preheader.us.us.preheader

for.cond5.preheader.us.us.preheader:              ; preds = %for.cond2.preheader.us.preheader, %for.cond2.for.inc21_crit_edge.us
  %indvars.iv617.us = phi i64 [ %indvars.iv.next7.us, %for.cond2.for.inc21_crit_edge.us ], [ 0, %for.cond2.preheader.us.preheader ]
  %3 = mul nsw i64 %indvars.iv617.us, 140
  br label %for.cond5.preheader.us.us

for.cond2.for.inc21_crit_edge.us:                 ; preds = %for.cond5.for.inc18_crit_edge.us.us
  %indvars.iv.next7.us = add nuw nsw i64 %indvars.iv617.us, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next7.us, 150
  br i1 %exitcond44, label %for.end23, label %for.cond5.preheader.us.us.preheader

for.cond5.preheader.us.us:                        ; preds = %for.cond5.for.inc18_crit_edge.us.us, %for.cond5.preheader.us.us.preheader
  %indvars.iv214.us.us = phi i64 [ %indvars.iv.next3.us.us, %for.cond5.for.inc18_crit_edge.us.us ], [ 0, %for.cond5.preheader.us.us.preheader ]
  %4 = add nsw i64 %indvars.iv214.us.us, %3
  %5 = mul i64 %4, 160
  br label %for.body7.us.us

for.cond5.for.inc18_crit_edge.us.us:              ; preds = %if.end.us.us
  %indvars.iv.next3.us.us = add nuw nsw i64 %indvars.iv214.us.us, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next3.us.us, 140
  br i1 %exitcond43, label %for.cond2.for.inc21_crit_edge.us, label %for.cond5.preheader.us.us

for.body7.us.us:                                  ; preds = %if.end.us.us, %for.cond5.preheader.us.us
  %indvars.iv12.us.us = phi i64 [ 0, %for.cond5.preheader.us.us ], [ %indvars.iv.next.us.us, %if.end.us.us ]
  %6 = add nsw i64 %indvars.iv12.us.us, %5
  %7 = trunc i64 %6 to i32
  %rem.us.us = srem i32 %7, 20
  %cmp11.us.us = icmp eq i32 %rem.us.us, 0
  br i1 %cmp11.us.us, label %if.then.us.us, label %if.end.us.us

if.then.us.us:                                    ; preds = %for.body7.us.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %8) #6
  br label %if.end.us.us

if.end.us.us:                                     ; preds = %if.then.us.us, %for.body7.us.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv617.us, i64 %indvars.iv214.us.us, i64 %indvars.iv12.us.us
  %10 = load double, double* %arrayidx16.us.us, align 8
  %call17.us.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %10) #6
  %indvars.iv.next.us.us = add nuw nsw i64 %indvars.iv12.us.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us.us, 160
  br i1 %exitcond, label %for.cond5.for.inc18_crit_edge.us.us, label %for.body7.us.us

for.end23:                                        ; preds = %for.cond2.for.inc21_crit_edge.us
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %12) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
