; ModuleID = 'A.ll'
source_filename = "doitgen.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline norecurse nounwind uwtable
define void @kernel_doitgen(i32 %nr, i32 %nq, i32 %np, [140 x [160 x double]]* %A, [160 x double]* %C4, double* %sum) #0 {
entry:
  %cmp35 = icmp sgt i32 %nr, 0
  br i1 %cmp35, label %for.cond1.preheader.lr.ph, label %for.end44

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %0 = add i32 %np, -1
  %1 = zext i32 %0 to i64
  %2 = shl nuw nsw i64 %1, 3
  %3 = add nuw nsw i64 %2, 8
  %4 = zext i32 %np to i64
  %5 = add nsw i64 %4, -1
  %6 = icmp sgt i32 %nq, 0
  %7 = icmp sgt i32 %np, 0
  %8 = icmp sgt i32 %np, 0
  %xtraiter67 = and i64 %4, 1
  %lcmp.mod68 = icmp eq i64 %xtraiter67, 0
  %9 = icmp eq i64 %5, 0
  %wide.trip.count55 = zext i32 %np to i64
  %sunkaddr75 = ptrtoint double* %sum to i64
  %wide.trip.count51.1 = zext i32 %np to i64
  %sunkaddr = ptrtoint double* %sum to i64
  %10 = icmp sgt i32 %np, 0
  %xtraiter69 = and i64 %4, 3
  %lcmp.mod70 = icmp eq i64 %xtraiter69, 0
  %11 = icmp ult i64 %5, 3
  %wide.trip.count59.3 = zext i32 %np to i64
  %wide.trip.count65 = zext i32 %nq to i64
  %12 = bitcast double* %sum to i8*
  %13 = icmp sgt i32 %np, 0
  %xtraiter = and i64 %4, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %14 = icmp ult i64 %5, 3
  %wide.trip.count.3 = zext i32 %np to i64
  %wide.trip.count42 = zext i32 %nq to i64
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.lr.ph, %for.end41
  %storemerge36 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %inc43, %for.end41 ]
  br i1 %6, label %for.cond4.preheader.lr.ph, label %for.end41

for.cond4.preheader.lr.ph:                        ; preds = %for.cond1.preheader
  %idxprom10 = sext i32 %storemerge36 to i64
  br i1 %7, label %for.cond4.preheader.us.preheader, label %for.cond4.preheader.preheader

for.cond4.preheader.us.preheader:                 ; preds = %for.cond4.preheader.lr.ph
  br label %for.cond4.preheader.us

for.cond4.preheader.preheader:                    ; preds = %for.cond4.preheader.lr.ph
  %idxprom30 = sext i32 %storemerge36 to i64
  br label %for.cond4.preheader

for.cond4.preheader.us:                           ; preds = %for.cond4.preheader.us.preheader, %for.end38.us
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %for.end38.us ], [ 0, %for.cond4.preheader.us.preheader ]
  %15 = phi i32 [ %split9.us, %for.end38.us ], [ %storemerge36, %for.cond4.preheader.us.preheader ]
  br i1 %8, label %for.body6.us.us.preheader, label %for.cond4.for.cond25.preheader_crit_edge.us.loopexit37

for.body6.us.us.preheader:                        ; preds = %for.cond4.preheader.us
  %arrayidx15.us.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom10, i64 %indvars.iv63, i64 0
  br label %for.body6.us.us

for.end38.us.loopexit:                            ; preds = %for.body27.us
  br label %for.end38.us

for.end38.us:                                     ; preds = %for.end38.us.loopexit, %for.body27.us.prol.loopexit, %for.cond4.for.cond25.preheader_crit_edge.us
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond66 = icmp eq i64 %indvars.iv.next64, %wide.trip.count65
  br i1 %exitcond66, label %for.end41.loopexit, label %for.cond4.preheader.us

for.body27.us:                                    ; preds = %for.body27.us.preheader, %for.body27.us
  %indvars.iv57 = phi i64 [ %indvars.iv.next58.3, %for.body27.us ], [ %indvars.iv57.unr, %for.body27.us.preheader ]
  %arrayidx29.us = getelementptr inbounds double, double* %sum, i64 %indvars.iv57
  %16 = bitcast double* %arrayidx29.us to i64*
  %17 = load i64, i64* %16, align 8
  %arrayidx35.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv63, i64 %indvars.iv57
  %18 = bitcast double* %arrayidx35.us to i64*
  store i64 %17, i64* %18, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %arrayidx29.us.1 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next58
  %19 = bitcast double* %arrayidx29.us.1 to i64*
  %20 = load i64, i64* %19, align 8
  %arrayidx35.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv63, i64 %indvars.iv.next58
  %21 = bitcast double* %arrayidx35.us.1 to i64*
  store i64 %20, i64* %21, align 8
  %indvars.iv.next58.1 = add nsw i64 %indvars.iv57, 2
  %arrayidx29.us.2 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next58.1
  %22 = bitcast double* %arrayidx29.us.2 to i64*
  %23 = load i64, i64* %22, align 8
  %arrayidx35.us.2 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv63, i64 %indvars.iv.next58.1
  %24 = bitcast double* %arrayidx35.us.2 to i64*
  store i64 %23, i64* %24, align 8
  %indvars.iv.next58.2 = add nsw i64 %indvars.iv57, 3
  %arrayidx29.us.3 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next58.2
  %25 = bitcast double* %arrayidx29.us.3 to i64*
  %26 = load i64, i64* %25, align 8
  %arrayidx35.us.3 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv63, i64 %indvars.iv.next58.2
  %27 = bitcast double* %arrayidx35.us.3 to i64*
  store i64 %26, i64* %27, align 8
  %indvars.iv.next58.3 = add nsw i64 %indvars.iv57, 4
  %exitcond60.3 = icmp eq i64 %indvars.iv.next58.3, %wide.trip.count59.3
  br i1 %exitcond60.3, label %for.end38.us.loopexit, label %for.body27.us

for.cond4.for.cond25.preheader_crit_edge.us.loopexit37: ; preds = %for.cond4.preheader.us
  call void @llvm.memset.p0i8.i64(i8* %12, i8 0, i64 %3, i32 8, i1 false)
  br label %for.cond4.for.cond25.preheader_crit_edge.us

for.cond4.for.cond25.preheader_crit_edge.us.loopexit: ; preds = %for.cond7.for.end_crit_edge.us.us
  br label %for.cond4.for.cond25.preheader_crit_edge.us

for.cond4.for.cond25.preheader_crit_edge.us:      ; preds = %for.cond4.for.cond25.preheader_crit_edge.us.loopexit, %for.cond4.for.cond25.preheader_crit_edge.us.loopexit37
  %split9.us = phi i32 [ %15, %for.cond4.for.cond25.preheader_crit_edge.us.loopexit37 ], [ %storemerge36, %for.cond4.for.cond25.preheader_crit_edge.us.loopexit ]
  br i1 %10, label %for.body27.lr.ph.us, label %for.end38.us

for.body6.us.us:                                  ; preds = %for.body6.us.us.preheader, %for.cond7.for.end_crit_edge.us.us
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %for.cond7.for.end_crit_edge.us.us ], [ 0, %for.body6.us.us.preheader ]
  %arrayidx.us.us = getelementptr inbounds double, double* %sum, i64 %indvars.iv53
  store double 0.000000e+00, double* %arrayidx.us.us, align 8
  br i1 %lcmp.mod68, label %for.body9.us.us.prol.loopexit, label %for.body9.us.us.prol

for.body9.us.us.prol:                             ; preds = %for.body6.us.us
  %28 = load double, double* %arrayidx15.us.us.prol, align 8
  %arrayidx19.us.us.prol = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 0, i64 %indvars.iv53
  %29 = load double, double* %arrayidx19.us.us.prol, align 8
  %mul.us.us.prol = fmul double %28, %29
  %add.us.us.prol = fadd double %mul.us.us.prol, 0.000000e+00
  %sunkaddr72 = shl i64 %indvars.iv53, 3
  %sunkaddr73 = add i64 %sunkaddr, %sunkaddr72
  %sunkaddr74 = inttoptr i64 %sunkaddr73 to double*
  store double %add.us.us.prol, double* %sunkaddr74, align 8
  br label %for.body9.us.us.prol.loopexit

for.body9.us.us.prol.loopexit:                    ; preds = %for.body9.us.us.prol, %for.body6.us.us
  %indvars.iv49.unr.ph = phi i64 [ 1, %for.body9.us.us.prol ], [ 0, %for.body6.us.us ]
  %.unr.ph = phi double [ %add.us.us.prol, %for.body9.us.us.prol ], [ 0.000000e+00, %for.body6.us.us ]
  br i1 %9, label %for.cond7.for.end_crit_edge.us.us, label %for.body9.us.us.preheader

for.body9.us.us.preheader:                        ; preds = %for.body9.us.us.prol.loopexit
  %sunkaddr76 = shl i64 %indvars.iv53, 3
  %sunkaddr77 = add i64 %sunkaddr75, %sunkaddr76
  %sunkaddr78 = inttoptr i64 %sunkaddr77 to double*
  br label %for.body9.us.us

for.cond7.for.end_crit_edge.us.us.loopexit:       ; preds = %for.body9.us.us
  br label %for.cond7.for.end_crit_edge.us.us

for.cond7.for.end_crit_edge.us.us:                ; preds = %for.cond7.for.end_crit_edge.us.us.loopexit, %for.body9.us.us.prol.loopexit
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next54, %wide.trip.count55
  br i1 %exitcond56, label %for.cond4.for.cond25.preheader_crit_edge.us.loopexit, label %for.body6.us.us

for.body9.us.us:                                  ; preds = %for.body9.us.us.preheader, %for.body9.us.us
  %indvars.iv49 = phi i64 [ %indvars.iv.next50.1, %for.body9.us.us ], [ %indvars.iv49.unr.ph, %for.body9.us.us.preheader ]
  %30 = phi double [ %add.us.us.1, %for.body9.us.us ], [ %.unr.ph, %for.body9.us.us.preheader ]
  %arrayidx15.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom10, i64 %indvars.iv63, i64 %indvars.iv49
  %31 = load double, double* %arrayidx15.us.us, align 8
  %arrayidx19.us.us = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv49, i64 %indvars.iv53
  %32 = load double, double* %arrayidx19.us.us, align 8
  %mul.us.us = fmul double %31, %32
  %add.us.us = fadd double %30, %mul.us.us
  store double %add.us.us, double* %sunkaddr78, align 8
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %arrayidx15.us.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom10, i64 %indvars.iv63, i64 %indvars.iv.next50
  %33 = load double, double* %arrayidx15.us.us.1, align 8
  %arrayidx19.us.us.1 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv.next50, i64 %indvars.iv53
  %34 = load double, double* %arrayidx19.us.us.1, align 8
  %mul.us.us.1 = fmul double %33, %34
  %add.us.us.1 = fadd double %add.us.us, %mul.us.us.1
  store double %add.us.us.1, double* %sunkaddr78, align 8
  %indvars.iv.next50.1 = add nsw i64 %indvars.iv49, 2
  %exitcond52.1 = icmp eq i64 %indvars.iv.next50.1, %wide.trip.count51.1
  br i1 %exitcond52.1, label %for.cond7.for.end_crit_edge.us.us.loopexit, label %for.body9.us.us

for.body27.lr.ph.us:                              ; preds = %for.cond4.for.cond25.preheader_crit_edge.us
  %idxprom30.us = sext i32 %split9.us to i64
  br i1 %lcmp.mod70, label %for.body27.us.prol.loopexit, label %for.body27.us.prol.preheader

for.body27.us.prol.preheader:                     ; preds = %for.body27.lr.ph.us
  br label %for.body27.us.prol

for.body27.us.prol:                               ; preds = %for.body27.us.prol.preheader, %for.body27.us.prol
  %indvars.iv57.prol = phi i64 [ %indvars.iv.next58.prol, %for.body27.us.prol ], [ 0, %for.body27.us.prol.preheader ]
  %prol.iter71 = phi i64 [ %prol.iter71.sub, %for.body27.us.prol ], [ %xtraiter69, %for.body27.us.prol.preheader ]
  %arrayidx29.us.prol = getelementptr inbounds double, double* %sum, i64 %indvars.iv57.prol
  %35 = bitcast double* %arrayidx29.us.prol to i64*
  %36 = load i64, i64* %35, align 8
  %arrayidx35.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv63, i64 %indvars.iv57.prol
  %37 = bitcast double* %arrayidx35.us.prol to i64*
  store i64 %36, i64* %37, align 8
  %indvars.iv.next58.prol = add nuw nsw i64 %indvars.iv57.prol, 1
  %prol.iter71.sub = add i64 %prol.iter71, -1
  %prol.iter71.cmp = icmp eq i64 %prol.iter71.sub, 0
  br i1 %prol.iter71.cmp, label %for.body27.us.prol.loopexit.loopexit, label %for.body27.us.prol, !llvm.loop !1

for.body27.us.prol.loopexit.loopexit:             ; preds = %for.body27.us.prol
  br label %for.body27.us.prol.loopexit

for.body27.us.prol.loopexit:                      ; preds = %for.body27.us.prol.loopexit.loopexit, %for.body27.lr.ph.us
  %indvars.iv57.unr = phi i64 [ 0, %for.body27.lr.ph.us ], [ %indvars.iv.next58.prol, %for.body27.us.prol.loopexit.loopexit ]
  br i1 %11, label %for.end38.us, label %for.body27.us.preheader

for.body27.us.preheader:                          ; preds = %for.body27.us.prol.loopexit
  br label %for.body27.us

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.end38
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %for.end38 ], [ 0, %for.cond4.preheader.preheader ]
  br i1 %13, label %for.body27.lr.ph, label %for.end38

for.body27.lr.ph:                                 ; preds = %for.cond4.preheader
  br i1 %lcmp.mod, label %for.body27.prol.loopexit, label %for.body27.prol.preheader

for.body27.prol.preheader:                        ; preds = %for.body27.lr.ph
  br label %for.body27.prol

for.body27.prol:                                  ; preds = %for.body27.prol.preheader, %for.body27.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body27.prol ], [ 0, %for.body27.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body27.prol ], [ %xtraiter, %for.body27.prol.preheader ]
  %arrayidx29.prol = getelementptr inbounds double, double* %sum, i64 %indvars.iv.prol
  %38 = bitcast double* %arrayidx29.prol to i64*
  %39 = load i64, i64* %38, align 8
  %arrayidx35.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30, i64 %indvars.iv40, i64 %indvars.iv.prol
  %40 = bitcast double* %arrayidx35.prol to i64*
  store i64 %39, i64* %40, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body27.prol.loopexit.loopexit, label %for.body27.prol, !llvm.loop !3

for.body27.prol.loopexit.loopexit:                ; preds = %for.body27.prol
  br label %for.body27.prol.loopexit

for.body27.prol.loopexit:                         ; preds = %for.body27.prol.loopexit.loopexit, %for.body27.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %for.body27.lr.ph ], [ %indvars.iv.next.prol, %for.body27.prol.loopexit.loopexit ]
  br i1 %14, label %for.end38, label %for.body27.preheader

for.body27.preheader:                             ; preds = %for.body27.prol.loopexit
  br label %for.body27

for.body27:                                       ; preds = %for.body27.preheader, %for.body27
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body27 ], [ %indvars.iv.unr, %for.body27.preheader ]
  %arrayidx29 = getelementptr inbounds double, double* %sum, i64 %indvars.iv
  %41 = bitcast double* %arrayidx29 to i64*
  %42 = load i64, i64* %41, align 8
  %arrayidx35 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30, i64 %indvars.iv40, i64 %indvars.iv
  %43 = bitcast double* %arrayidx35 to i64*
  store i64 %42, i64* %43, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx29.1 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next
  %44 = bitcast double* %arrayidx29.1 to i64*
  %45 = load i64, i64* %44, align 8
  %arrayidx35.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30, i64 %indvars.iv40, i64 %indvars.iv.next
  %46 = bitcast double* %arrayidx35.1 to i64*
  store i64 %45, i64* %46, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx29.2 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next.1
  %47 = bitcast double* %arrayidx29.2 to i64*
  %48 = load i64, i64* %47, align 8
  %arrayidx35.2 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30, i64 %indvars.iv40, i64 %indvars.iv.next.1
  %49 = bitcast double* %arrayidx35.2 to i64*
  store i64 %48, i64* %49, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx29.3 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next.2
  %50 = bitcast double* %arrayidx29.3 to i64*
  %51 = load i64, i64* %50, align 8
  %arrayidx35.3 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30, i64 %indvars.iv40, i64 %indvars.iv.next.2
  %52 = bitcast double* %arrayidx35.3 to i64*
  store i64 %51, i64* %52, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %for.end38.loopexit, label %for.body27

for.end38.loopexit:                               ; preds = %for.body27
  br label %for.end38

for.end38:                                        ; preds = %for.end38.loopexit, %for.body27.prol.loopexit, %for.cond4.preheader
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next41, %wide.trip.count42
  br i1 %exitcond43, label %for.end41.loopexit81, label %for.cond4.preheader

for.end41.loopexit:                               ; preds = %for.end38.us
  br label %for.end41

for.end41.loopexit81:                             ; preds = %for.end38
  br label %for.end41

for.end41:                                        ; preds = %for.end41.loopexit81, %for.end41.loopexit, %for.cond1.preheader
  %.lcssa6 = phi i32 [ %storemerge36, %for.cond1.preheader ], [ %split9.us, %for.end41.loopexit ], [ %storemerge36, %for.end41.loopexit81 ]
  %inc43 = add nsw i32 %.lcssa6, 1
  %cmp = icmp slt i32 %inc43, %nr
  br i1 %cmp, label %for.cond1.preheader, label %for.end44.loopexit

for.end44.loopexit:                               ; preds = %for.end41
  br label %for.end44

for.end44:                                        ; preds = %for.end44.loopexit, %entry
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #1 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %arraydecay = bitcast i8* %call to [140 x [160 x double]]*
  %arraydecay3 = bitcast i8* %call2 to [160 x double]*
  tail call void @init_array([140 x [160 x double]]* %arraydecay, [160 x double]* %arraydecay3)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay5 = bitcast i8* %call2 to [160 x double]*
  %arraydecay6 = bitcast i8* %call1 to double*
  tail call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %arraydecay, [160 x double]* %arraydecay5, double* %arraydecay6)
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
  %1 = bitcast i8* %call to [140 x [160 x double]]*
  tail call void @print_array([140 x [160 x double]]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array([140 x [160 x double]]* %A, [160 x double]* %C4) #0 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end14, %entry
  %indvars.iv20 = phi i64 [ 0, %entry ], [ %indvars.iv.next21, %for.end14 ]
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.end, %for.cond1.preheader
  %indvars.iv16 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next17, %for.end ]
  %0 = mul nuw nsw i64 %indvars.iv16, %indvars.iv20
  br label %for.body6

for.body6:                                        ; preds = %for.body6, %for.cond4.preheader
  %indvars.iv12 = phi i64 [ 0, %for.cond4.preheader ], [ %indvars.iv.next13.1, %for.body6 ]
  %1 = add nuw nsw i64 %indvars.iv12, %0
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 160
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 1.600000e+02
  %arrayidx11 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv20, i64 %indvars.iv16, i64 %indvars.iv12
  store double %div, double* %arrayidx11, align 8
  %indvars.iv.next13 = or i64 %indvars.iv12, 1
  %3 = add nuw nsw i64 %indvars.iv.next13, %0
  %4 = trunc i64 %3 to i32
  %rem.1 = srem i32 %4, 160
  %conv.1 = sitofp i32 %rem.1 to double
  %div.1 = fdiv double %conv.1, 1.600000e+02
  %arrayidx11.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv20, i64 %indvars.iv16, i64 %indvars.iv.next13
  store double %div.1, double* %arrayidx11.1, align 8
  %indvars.iv.next13.1 = add nsw i64 %indvars.iv12, 2
  %exitcond15.1 = icmp eq i64 %indvars.iv.next13.1, 160
  br i1 %exitcond15.1, label %for.end, label %for.body6

for.end:                                          ; preds = %for.body6
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next17, 140
  br i1 %exitcond19, label %for.end14, label %for.cond4.preheader

for.end14:                                        ; preds = %for.end
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next21, 150
  br i1 %exitcond22, label %for.cond22.preheader.preheader, label %for.cond1.preheader

for.cond22.preheader.preheader:                   ; preds = %for.end14
  br label %for.cond22.preheader

for.cond22.preheader:                             ; preds = %for.cond22.preheader.preheader, %for.end37
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %for.end37 ], [ 0, %for.cond22.preheader.preheader ]
  br label %for.body25

for.body25:                                       ; preds = %for.body25, %for.cond22.preheader
  %indvars.iv = phi i64 [ 0, %for.cond22.preheader ], [ %indvars.iv.next.1, %for.body25 ]
  %5 = mul nuw nsw i64 %indvars.iv, %indvars.iv9
  %6 = trunc i64 %5 to i32
  %rem27 = srem i32 %6, 160
  %conv28 = sitofp i32 %rem27 to double
  %div30 = fdiv double %conv28, 1.600000e+02
  %arrayidx34 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv9, i64 %indvars.iv
  store double %div30, double* %arrayidx34, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %7 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv9
  %8 = trunc i64 %7 to i32
  %rem27.1 = srem i32 %8, 160
  %conv28.1 = sitofp i32 %rem27.1 to double
  %div30.1 = fdiv double %conv28.1, 1.600000e+02
  %arrayidx34.1 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv9, i64 %indvars.iv.next
  store double %div30.1, double* %arrayidx34.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond.1, label %for.end37, label %for.body25

for.end37:                                        ; preds = %for.body25
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next10, 160
  br i1 %exitcond11, label %for.end40, label %for.cond22.preheader

for.end40:                                        ; preds = %for.end37
  ret void
}

declare void @polybench_timer_start(...) #2

declare void @polybench_timer_stop(...) #2

declare void @polybench_timer_print(...) #2

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([140 x [160 x double]]* %A) #1 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.end20, %entry
  %indvars.iv12 = phi i64 [ 0, %entry ], [ %indvars.iv.next13, %for.end20 ]
  %3 = mul nuw nsw i64 %indvars.iv12, 140
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.end, %for.cond2.preheader
  %indvars.iv7 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next8, %for.end ]
  %4 = add nuw nsw i64 %indvars.iv7, %3
  %5 = mul nuw nsw i64 %4, 160
  br label %for.body7

for.body7:                                        ; preds = %if.end, %for.cond5.preheader
  %indvars.iv = phi i64 [ 0, %for.cond5.preheader ], [ %indvars.iv.next, %if.end ]
  %6 = add nuw nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %rem = srem i32 %7, 20
  %cmp11 = icmp eq i32 %rem, 0
  br i1 %cmp11, label %if.then, label %if.end

if.then:                                          ; preds = %for.body7
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %8) #6
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body7
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv12, i64 %indvars.iv7, i64 %indvars.iv
  %10 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %10) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond, label %for.end, label %for.body7

for.end:                                          ; preds = %if.end
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next8, 140
  br i1 %exitcond11, label %for.end20, label %for.cond5.preheader

for.end20:                                        ; preds = %for.end
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next13, 150
  br i1 %exitcond15, label %for.end23, label %for.cond2.preheader

for.end23:                                        ; preds = %for.end20
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %12) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

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
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
