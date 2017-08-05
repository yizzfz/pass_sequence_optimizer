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

; Function Attrs: noinline norecurse nounwind uwtable
define void @kernel_doitgen(i32 %nr, i32 %nq, i32 %np, [140 x [160 x double]]* nocapture %A, [160 x double]* nocapture readonly %C4, double* nocapture %sum) local_unnamed_addr #0 {
entry:
  %sum67 = bitcast double* %sum to i8*
  %cmp29 = icmp sgt i32 %nr, 0
  br i1 %cmp29, label %for.cond1.preheader.lr.ph, label %for.end44

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %0 = zext i32 %np to i64
  %1 = add nsw i64 %0, -1
  %2 = shl nuw nsw i64 %0, 3
  %3 = icmp sgt i32 %nq, 0
  %4 = icmp sgt i32 %np, 0
  %5 = icmp sgt i32 %np, 0
  %wide.trip.count55 = zext i32 %nq to i64
  %xtraiter68 = and i64 %0, 1
  %lcmp.mod69 = icmp eq i64 %xtraiter68, 0
  %6 = icmp eq i64 %1, 0
  %wide.trip.count47 = zext i32 %np to i64
  %sunkaddr = ptrtoint double* %sum to i64
  %sunkaddr.1 = ptrtoint double* %sum to i64
  %wide.trip.count43.1 = zext i32 %np to i64
  %sunkaddr.prol = ptrtoint double* %sum to i64
  %7 = icmp sgt i32 %np, 0
  %xtraiter71 = and i64 %0, 3
  %lcmp.mod72 = icmp eq i64 %xtraiter71, 0
  %8 = icmp ult i64 %1, 3
  %wide.trip.count51.3 = zext i32 %np to i64
  %9 = icmp sgt i32 %np, 0
  %xtraiter = and i64 %0, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %10 = icmp ult i64 %1, 3
  %wide.trip.count.3 = zext i32 %np to i64
  %wide.trip.count35 = zext i32 %nq to i64
  %wide.trip.count59 = zext i32 %nr to i64
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc42, %for.cond1.preheader.lr.ph
  %indvars.iv57 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next58, %for.inc42 ]
  br i1 %3, label %for.cond4.preheader.lr.ph, label %for.inc42

for.cond4.preheader.lr.ph:                        ; preds = %for.cond1.preheader
  br i1 %4, label %for.cond4.preheader.us.preheader, label %for.cond4.preheader.preheader

for.cond4.preheader.preheader:                    ; preds = %for.cond4.preheader.lr.ph
  br label %for.cond4.preheader

for.cond4.preheader.us.preheader:                 ; preds = %for.cond4.preheader.lr.ph
  br label %for.cond4.preheader.us

for.cond4.preheader.us:                           ; preds = %for.cond4.preheader.us.preheader, %for.inc39.us
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %for.inc39.us ], [ 0, %for.cond4.preheader.us.preheader ]
  br i1 %5, label %for.body6.us.us.preheader, label %for.cond4.for.cond25.preheader_crit_edge.us.thread

for.body6.us.us.preheader:                        ; preds = %for.cond4.preheader.us
  %arrayidx15.us.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv57, i64 %indvars.iv53, i64 0
  br label %for.body6.us.us

for.inc39.us.loopexit:                            ; preds = %for.body27.us
  br label %for.inc39.us

for.inc39.us:                                     ; preds = %for.inc39.us.loopexit, %for.cond4.for.cond25.preheader_crit_edge.us.thread, %for.body27.us.prol.loopexit, %for.cond4.for.cond25.preheader_crit_edge.us
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next54, %wide.trip.count55
  br i1 %exitcond56, label %for.inc42.loopexit, label %for.cond4.preheader.us

for.body27.us:                                    ; preds = %for.body27.us.preheader, %for.body27.us
  %indvars.iv49 = phi i64 [ %indvars.iv.next50.3, %for.body27.us ], [ %indvars.iv49.unr, %for.body27.us.preheader ]
  %arrayidx29.us = getelementptr inbounds double, double* %sum, i64 %indvars.iv49
  %11 = bitcast double* %arrayidx29.us to i64*
  %12 = load i64, i64* %11, align 8
  %arrayidx35.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv57, i64 %indvars.iv53, i64 %indvars.iv49
  %13 = bitcast double* %arrayidx35.us to i64*
  store i64 %12, i64* %13, align 8
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %arrayidx29.us.1 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next50
  %14 = bitcast double* %arrayidx29.us.1 to i64*
  %15 = load i64, i64* %14, align 8
  %arrayidx35.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv57, i64 %indvars.iv53, i64 %indvars.iv.next50
  %16 = bitcast double* %arrayidx35.us.1 to i64*
  store i64 %15, i64* %16, align 8
  %indvars.iv.next50.1 = add nsw i64 %indvars.iv49, 2
  %arrayidx29.us.2 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next50.1
  %17 = bitcast double* %arrayidx29.us.2 to i64*
  %18 = load i64, i64* %17, align 8
  %arrayidx35.us.2 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv57, i64 %indvars.iv53, i64 %indvars.iv.next50.1
  %19 = bitcast double* %arrayidx35.us.2 to i64*
  store i64 %18, i64* %19, align 8
  %indvars.iv.next50.2 = add nsw i64 %indvars.iv49, 3
  %arrayidx29.us.3 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next50.2
  %20 = bitcast double* %arrayidx29.us.3 to i64*
  %21 = load i64, i64* %20, align 8
  %arrayidx35.us.3 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv57, i64 %indvars.iv53, i64 %indvars.iv.next50.2
  %22 = bitcast double* %arrayidx35.us.3 to i64*
  store i64 %21, i64* %22, align 8
  %indvars.iv.next50.3 = add nsw i64 %indvars.iv49, 4
  %exitcond52.3 = icmp eq i64 %indvars.iv.next50.3, %wide.trip.count51.3
  br i1 %exitcond52.3, label %for.inc39.us.loopexit, label %for.body27.us

for.cond4.for.cond25.preheader_crit_edge.us.thread: ; preds = %for.cond4.preheader.us
  call void @llvm.memset.p0i8.i64(i8* %sum67, i8 0, i64 %2, i32 8, i1 false)
  br label %for.inc39.us

for.cond4.for.cond25.preheader_crit_edge.us:      ; preds = %for.cond7.for.inc22_crit_edge.us.us
  br i1 %7, label %for.body27.lr.ph.us, label %for.inc39.us

for.body6.us.us:                                  ; preds = %for.body6.us.us.preheader, %for.cond7.for.inc22_crit_edge.us.us
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %for.cond7.for.inc22_crit_edge.us.us ], [ 0, %for.body6.us.us.preheader ]
  %arrayidx.us.us = getelementptr inbounds double, double* %sum, i64 %indvars.iv45
  store double 0.000000e+00, double* %arrayidx.us.us, align 8
  br i1 %lcmp.mod69, label %for.body9.us.us.prol.loopexit, label %for.body9.us.us.prol

for.body9.us.us.prol:                             ; preds = %for.body6.us.us
  %23 = load double, double* %arrayidx15.us.us.prol, align 8
  %arrayidx19.us.us.prol = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 0, i64 %indvars.iv45
  %24 = load double, double* %arrayidx19.us.us.prol, align 8
  %mul.us.us.prol = fmul double %23, %24
  %sunkaddr61.prol = shl i64 %indvars.iv45, 3
  %sunkaddr62.prol = add i64 %sunkaddr.prol, %sunkaddr61.prol
  %sunkaddr63.prol = inttoptr i64 %sunkaddr62.prol to double*
  %25 = load double, double* %sunkaddr63.prol, align 8
  %add.us.us.prol = fadd double %25, %mul.us.us.prol
  store double %add.us.us.prol, double* %sunkaddr63.prol, align 8
  br label %for.body9.us.us.prol.loopexit

for.body9.us.us.prol.loopexit:                    ; preds = %for.body9.us.us.prol, %for.body6.us.us
  %indvars.iv41.unr.ph = phi i64 [ 1, %for.body9.us.us.prol ], [ 0, %for.body6.us.us ]
  br i1 %6, label %for.cond7.for.inc22_crit_edge.us.us, label %for.body9.us.us.preheader

for.body9.us.us.preheader:                        ; preds = %for.body9.us.us.prol.loopexit
  %sunkaddr61 = shl i64 %indvars.iv45, 3
  %sunkaddr62 = add i64 %sunkaddr, %sunkaddr61
  %sunkaddr63 = inttoptr i64 %sunkaddr62 to double*
  %sunkaddr61.1 = shl i64 %indvars.iv45, 3
  %sunkaddr62.1 = add i64 %sunkaddr.1, %sunkaddr61.1
  %sunkaddr63.1 = inttoptr i64 %sunkaddr62.1 to double*
  br label %for.body9.us.us

for.cond7.for.inc22_crit_edge.us.us.loopexit:     ; preds = %for.body9.us.us
  br label %for.cond7.for.inc22_crit_edge.us.us

for.cond7.for.inc22_crit_edge.us.us:              ; preds = %for.cond7.for.inc22_crit_edge.us.us.loopexit, %for.body9.us.us.prol.loopexit
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next46, %wide.trip.count47
  br i1 %exitcond48, label %for.cond4.for.cond25.preheader_crit_edge.us, label %for.body6.us.us

for.body9.us.us:                                  ; preds = %for.body9.us.us.preheader, %for.body9.us.us
  %indvars.iv41 = phi i64 [ %indvars.iv.next42.1, %for.body9.us.us ], [ %indvars.iv41.unr.ph, %for.body9.us.us.preheader ]
  %arrayidx15.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv57, i64 %indvars.iv53, i64 %indvars.iv41
  %26 = load double, double* %arrayidx15.us.us, align 8
  %arrayidx19.us.us = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv41, i64 %indvars.iv45
  %27 = load double, double* %arrayidx19.us.us, align 8
  %mul.us.us = fmul double %26, %27
  %28 = load double, double* %sunkaddr63, align 8
  %add.us.us = fadd double %28, %mul.us.us
  store double %add.us.us, double* %sunkaddr63, align 8
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %arrayidx15.us.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv57, i64 %indvars.iv53, i64 %indvars.iv.next42
  %29 = load double, double* %arrayidx15.us.us.1, align 8
  %arrayidx19.us.us.1 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv.next42, i64 %indvars.iv45
  %30 = load double, double* %arrayidx19.us.us.1, align 8
  %mul.us.us.1 = fmul double %29, %30
  %31 = load double, double* %sunkaddr63.1, align 8
  %add.us.us.1 = fadd double %31, %mul.us.us.1
  store double %add.us.us.1, double* %sunkaddr63.1, align 8
  %indvars.iv.next42.1 = add nsw i64 %indvars.iv41, 2
  %exitcond44.1 = icmp eq i64 %indvars.iv.next42.1, %wide.trip.count43.1
  br i1 %exitcond44.1, label %for.cond7.for.inc22_crit_edge.us.us.loopexit, label %for.body9.us.us

for.body27.lr.ph.us:                              ; preds = %for.cond4.for.cond25.preheader_crit_edge.us
  br i1 %lcmp.mod72, label %for.body27.us.prol.loopexit, label %for.body27.us.prol.preheader

for.body27.us.prol.preheader:                     ; preds = %for.body27.lr.ph.us
  br label %for.body27.us.prol

for.body27.us.prol:                               ; preds = %for.body27.us.prol.preheader, %for.body27.us.prol
  %indvars.iv49.prol = phi i64 [ %indvars.iv.next50.prol, %for.body27.us.prol ], [ 0, %for.body27.us.prol.preheader ]
  %prol.iter73 = phi i64 [ %prol.iter73.sub, %for.body27.us.prol ], [ %xtraiter71, %for.body27.us.prol.preheader ]
  %arrayidx29.us.prol = getelementptr inbounds double, double* %sum, i64 %indvars.iv49.prol
  %32 = bitcast double* %arrayidx29.us.prol to i64*
  %33 = load i64, i64* %32, align 8
  %arrayidx35.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv57, i64 %indvars.iv53, i64 %indvars.iv49.prol
  %34 = bitcast double* %arrayidx35.us.prol to i64*
  store i64 %33, i64* %34, align 8
  %indvars.iv.next50.prol = add nuw nsw i64 %indvars.iv49.prol, 1
  %prol.iter73.sub = add i64 %prol.iter73, -1
  %prol.iter73.cmp = icmp eq i64 %prol.iter73.sub, 0
  br i1 %prol.iter73.cmp, label %for.body27.us.prol.loopexit.loopexit, label %for.body27.us.prol, !llvm.loop !1

for.body27.us.prol.loopexit.loopexit:             ; preds = %for.body27.us.prol
  br label %for.body27.us.prol.loopexit

for.body27.us.prol.loopexit:                      ; preds = %for.body27.us.prol.loopexit.loopexit, %for.body27.lr.ph.us
  %indvars.iv49.unr = phi i64 [ 0, %for.body27.lr.ph.us ], [ %indvars.iv.next50.prol, %for.body27.us.prol.loopexit.loopexit ]
  br i1 %8, label %for.inc39.us, label %for.body27.us.preheader

for.body27.us.preheader:                          ; preds = %for.body27.us.prol.loopexit
  br label %for.body27.us

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.inc39
  %indvars.iv33 = phi i64 [ %indvars.iv.next34, %for.inc39 ], [ 0, %for.cond4.preheader.preheader ]
  br i1 %9, label %for.body27.lr.ph, label %for.inc39

for.body27.lr.ph:                                 ; preds = %for.cond4.preheader
  br i1 %lcmp.mod, label %for.body27.prol.loopexit, label %for.body27.prol.preheader

for.body27.prol.preheader:                        ; preds = %for.body27.lr.ph
  br label %for.body27.prol

for.body27.prol:                                  ; preds = %for.body27.prol.preheader, %for.body27.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body27.prol ], [ 0, %for.body27.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body27.prol ], [ %xtraiter, %for.body27.prol.preheader ]
  %arrayidx29.prol = getelementptr inbounds double, double* %sum, i64 %indvars.iv.prol
  %35 = bitcast double* %arrayidx29.prol to i64*
  %36 = load i64, i64* %35, align 8
  %arrayidx35.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv57, i64 %indvars.iv33, i64 %indvars.iv.prol
  %37 = bitcast double* %arrayidx35.prol to i64*
  store i64 %36, i64* %37, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body27.prol.loopexit.loopexit, label %for.body27.prol, !llvm.loop !3

for.body27.prol.loopexit.loopexit:                ; preds = %for.body27.prol
  br label %for.body27.prol.loopexit

for.body27.prol.loopexit:                         ; preds = %for.body27.prol.loopexit.loopexit, %for.body27.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %for.body27.lr.ph ], [ %indvars.iv.next.prol, %for.body27.prol.loopexit.loopexit ]
  br i1 %10, label %for.inc39, label %for.body27.preheader

for.body27.preheader:                             ; preds = %for.body27.prol.loopexit
  br label %for.body27

for.body27:                                       ; preds = %for.body27.preheader, %for.body27
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body27 ], [ %indvars.iv.unr, %for.body27.preheader ]
  %arrayidx29 = getelementptr inbounds double, double* %sum, i64 %indvars.iv
  %38 = bitcast double* %arrayidx29 to i64*
  %39 = load i64, i64* %38, align 8
  %arrayidx35 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv57, i64 %indvars.iv33, i64 %indvars.iv
  %40 = bitcast double* %arrayidx35 to i64*
  store i64 %39, i64* %40, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx29.1 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next
  %41 = bitcast double* %arrayidx29.1 to i64*
  %42 = load i64, i64* %41, align 8
  %arrayidx35.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv57, i64 %indvars.iv33, i64 %indvars.iv.next
  %43 = bitcast double* %arrayidx35.1 to i64*
  store i64 %42, i64* %43, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx29.2 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next.1
  %44 = bitcast double* %arrayidx29.2 to i64*
  %45 = load i64, i64* %44, align 8
  %arrayidx35.2 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv57, i64 %indvars.iv33, i64 %indvars.iv.next.1
  %46 = bitcast double* %arrayidx35.2 to i64*
  store i64 %45, i64* %46, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx29.3 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next.2
  %47 = bitcast double* %arrayidx29.3 to i64*
  %48 = load i64, i64* %47, align 8
  %arrayidx35.3 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv57, i64 %indvars.iv33, i64 %indvars.iv.next.2
  %49 = bitcast double* %arrayidx35.3 to i64*
  store i64 %48, i64* %49, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %for.inc39.loopexit, label %for.body27

for.inc39.loopexit:                               ; preds = %for.body27
  br label %for.inc39

for.inc39:                                        ; preds = %for.inc39.loopexit, %for.body27.prol.loopexit, %for.cond4.preheader
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next34, %wide.trip.count35
  br i1 %exitcond36, label %for.inc42.loopexit76, label %for.cond4.preheader

for.inc42.loopexit:                               ; preds = %for.inc39.us
  br label %for.inc42

for.inc42.loopexit76:                             ; preds = %for.inc39
  br label %for.inc42

for.inc42:                                        ; preds = %for.inc42.loopexit76, %for.inc42.loopexit, %for.cond1.preheader
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next58, %wide.trip.count59
  br i1 %exitcond60, label %for.end44.loopexit, label %for.cond1.preheader

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
  tail call fastcc void @init_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %arraydecay, [160 x double]* %arraydecay3)
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
  %1 = bitcast i8* %call to [140 x [160 x double]]*
  tail call fastcc void @print_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %nr, i32 %nq, i32 %np, [140 x [160 x double]]* nocapture %A, [160 x double]* nocapture %C4) unnamed_addr #0 {
entry:
  %cmp10 = icmp sgt i32 %nr, 0
  br i1 %cmp10, label %for.cond1.preheader.lr.ph, label %for.cond18.preheader

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp28 = icmp sgt i32 %nq, 0
  %conv7 = sitofp i32 %np to double
  br i1 %cmp28, label %for.cond1.preheader.us.preheader, label %for.cond18.preheader

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %0 = icmp sgt i32 %np, 0
  %wide.trip.count55 = zext i32 %nr to i64
  %1 = and i32 %np, 1
  %lcmp.mod61 = icmp eq i32 %1, 0
  %2 = icmp eq i32 %np, 1
  %wide.trip.count51 = zext i32 %nq to i64
  %wide.trip.count46.1 = zext i32 %np to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.inc15_crit_edge.us
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %for.cond1.for.inc15_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  br i1 %0, label %for.cond4.preheader.us.us.preheader, label %for.cond1.for.inc15_crit_edge.us

for.cond4.preheader.us.us.preheader:              ; preds = %for.cond1.preheader.us
  br label %for.cond4.preheader.us.us

for.cond1.for.inc15_crit_edge.us.loopexit:        ; preds = %for.cond4.for.inc12_crit_edge.us.us
  br label %for.cond1.for.inc15_crit_edge.us

for.cond1.for.inc15_crit_edge.us:                 ; preds = %for.cond1.for.inc15_crit_edge.us.loopexit, %for.cond1.preheader.us
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next54, %wide.trip.count55
  br i1 %exitcond56, label %for.cond18.preheader.loopexit, label %for.cond1.preheader.us

for.cond4.preheader.us.us:                        ; preds = %for.cond4.preheader.us.us.preheader, %for.cond4.for.inc12_crit_edge.us.us
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %for.cond4.for.inc12_crit_edge.us.us ], [ 0, %for.cond4.preheader.us.us.preheader ]
  %3 = mul nuw nsw i64 %indvars.iv48, %indvars.iv53
  br i1 %lcmp.mod61, label %for.body6.us.us.prol.loopexit, label %for.body6.us.us.prol

for.body6.us.us.prol:                             ; preds = %for.cond4.preheader.us.us
  %4 = trunc i64 %3 to i32
  %rem.us.us.prol = srem i32 %4, %np
  %conv.us.us.prol = sitofp i32 %rem.us.us.prol to double
  %div.us.us.prol = fdiv double %conv.us.us.prol, %conv7
  %arrayidx11.us.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv53, i64 %indvars.iv48, i64 0
  store double %div.us.us.prol, double* %arrayidx11.us.us.prol, align 8
  br label %for.body6.us.us.prol.loopexit

for.body6.us.us.prol.loopexit:                    ; preds = %for.body6.us.us.prol, %for.cond4.preheader.us.us
  %indvars.iv43.unr.ph = phi i64 [ 1, %for.body6.us.us.prol ], [ 0, %for.cond4.preheader.us.us ]
  br i1 %2, label %for.cond4.for.inc12_crit_edge.us.us, label %for.body6.us.us.preheader

for.body6.us.us.preheader:                        ; preds = %for.body6.us.us.prol.loopexit
  br label %for.body6.us.us

for.cond4.for.inc12_crit_edge.us.us.loopexit:     ; preds = %for.body6.us.us
  br label %for.cond4.for.inc12_crit_edge.us.us

for.cond4.for.inc12_crit_edge.us.us:              ; preds = %for.cond4.for.inc12_crit_edge.us.us.loopexit, %for.body6.us.us.prol.loopexit
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next49, %wide.trip.count51
  br i1 %exitcond52, label %for.cond1.for.inc15_crit_edge.us.loopexit, label %for.cond4.preheader.us.us

for.body6.us.us:                                  ; preds = %for.body6.us.us.preheader, %for.body6.us.us
  %indvars.iv43 = phi i64 [ %indvars.iv.next44.1, %for.body6.us.us ], [ %indvars.iv43.unr.ph, %for.body6.us.us.preheader ]
  %5 = add nuw nsw i64 %indvars.iv43, %3
  %6 = trunc i64 %5 to i32
  %rem.us.us = srem i32 %6, %np
  %conv.us.us = sitofp i32 %rem.us.us to double
  %arrayidx11.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv53, i64 %indvars.iv48, i64 %indvars.iv43
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %7 = add nuw nsw i64 %indvars.iv.next44, %3
  %8 = trunc i64 %7 to i32
  %rem.us.us.1 = srem i32 %8, %np
  %conv.us.us.1 = sitofp i32 %rem.us.us.1 to double
  %div.us.us.v.i1.1 = insertelement <2 x double> undef, double %conv7, i32 0
  %div.us.us.v.i1.2 = insertelement <2 x double> %div.us.us.v.i1.1, double %conv7, i32 1
  %div.us.us.v.i0.1 = insertelement <2 x double> undef, double %conv.us.us, i32 0
  %div.us.us.v.i0.2 = insertelement <2 x double> %div.us.us.v.i0.1, double %conv.us.us.1, i32 1
  %div.us.us = fdiv <2 x double> %div.us.us.v.i0.2, %div.us.us.v.i1.2
  %9 = bitcast double* %arrayidx11.us.us to <2 x double>*
  store <2 x double> %div.us.us, <2 x double>* %9, align 8
  %indvars.iv.next44.1 = add nsw i64 %indvars.iv43, 2
  %exitcond47.1 = icmp eq i64 %indvars.iv.next44.1, %wide.trip.count46.1
  br i1 %exitcond47.1, label %for.cond4.for.inc12_crit_edge.us.us.loopexit, label %for.body6.us.us

for.cond18.preheader.loopexit:                    ; preds = %for.cond1.for.inc15_crit_edge.us
  br label %for.cond18.preheader

for.cond18.preheader:                             ; preds = %for.cond18.preheader.loopexit, %for.cond1.preheader.lr.ph, %entry
  %cmp193 = icmp sgt i32 %np, 0
  br i1 %cmp193, label %for.cond22.preheader.lr.ph, label %for.end40

for.cond22.preheader.lr.ph:                       ; preds = %for.cond18.preheader
  %conv29 = sitofp i32 %np to double
  %10 = and i32 %np, 1
  %lcmp.mod = icmp eq i32 %10, 0
  %11 = icmp eq i32 %np, 1
  %wide.trip.count40 = zext i32 %np to i64
  %wide.trip.count.1 = zext i32 %np to i64
  %div30.us.prol = fdiv double 0.000000e+00, %conv29
  br label %for.cond22.preheader.us

for.cond22.preheader.us:                          ; preds = %for.cond22.for.inc38_crit_edge.us, %for.cond22.preheader.lr.ph
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %for.cond22.for.inc38_crit_edge.us ], [ 0, %for.cond22.preheader.lr.ph ]
  br i1 %lcmp.mod, label %for.body25.us.prol.loopexit, label %for.body25.us.prol

for.body25.us.prol:                               ; preds = %for.cond22.preheader.us
  %arrayidx34.us.prol = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv38, i64 0
  store double %div30.us.prol, double* %arrayidx34.us.prol, align 8
  br label %for.body25.us.prol.loopexit

for.body25.us.prol.loopexit:                      ; preds = %for.body25.us.prol, %for.cond22.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body25.us.prol ], [ 0, %for.cond22.preheader.us ]
  br i1 %11, label %for.cond22.for.inc38_crit_edge.us, label %for.body25.us.preheader

for.body25.us.preheader:                          ; preds = %for.body25.us.prol.loopexit
  br label %for.body25.us

for.body25.us:                                    ; preds = %for.body25.us.preheader, %for.body25.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body25.us ], [ %indvars.iv.unr.ph, %for.body25.us.preheader ]
  %12 = mul nuw nsw i64 %indvars.iv, %indvars.iv38
  %13 = trunc i64 %12 to i32
  %rem27.us = srem i32 %13, %np
  %conv28.us = sitofp i32 %rem27.us to double
  %arrayidx34.us = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv38, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %14 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv38
  %15 = trunc i64 %14 to i32
  %rem27.us.1 = srem i32 %15, %np
  %conv28.us.1 = sitofp i32 %rem27.us.1 to double
  %div30.us.v.i1.1 = insertelement <2 x double> undef, double %conv29, i32 0
  %div30.us.v.i1.2 = insertelement <2 x double> %div30.us.v.i1.1, double %conv29, i32 1
  %div30.us.v.i0.1 = insertelement <2 x double> undef, double %conv28.us, i32 0
  %div30.us.v.i0.2 = insertelement <2 x double> %div30.us.v.i0.1, double %conv28.us.1, i32 1
  %div30.us = fdiv <2 x double> %div30.us.v.i0.2, %div30.us.v.i1.2
  %16 = bitcast double* %arrayidx34.us to <2 x double>*
  store <2 x double> %div30.us, <2 x double>* %16, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.cond22.for.inc38_crit_edge.us.loopexit, label %for.body25.us

for.cond22.for.inc38_crit_edge.us.loopexit:       ; preds = %for.body25.us
  br label %for.cond22.for.inc38_crit_edge.us

for.cond22.for.inc38_crit_edge.us:                ; preds = %for.cond22.for.inc38_crit_edge.us.loopexit, %for.body25.us.prol.loopexit
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next39, %wide.trip.count40
  br i1 %exitcond41, label %for.end40.loopexit, label %for.cond22.preheader.us

for.end40.loopexit:                               ; preds = %for.cond22.for.inc38_crit_edge.us
  br label %for.end40

for.end40:                                        ; preds = %for.end40.loopexit, %for.cond18.preheader
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %nr, i32 %nq, i32 %np, [140 x [160 x double]]* nocapture readonly %A) unnamed_addr #1 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp7 = icmp sgt i32 %nr, 0
  %cmp34 = icmp sgt i32 %nq, 0
  %or.cond = and i1 %cmp7, %cmp34
  br i1 %or.cond, label %for.cond2.preheader.us.preheader, label %for.end23

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %nq to i64
  %4 = icmp sgt i32 %np, 0
  %wide.trip.count45 = zext i32 %nr to i64
  %wide.trip.count = zext i32 %np to i64
  %wide.trip.count40 = zext i32 %nq to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc21_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv42 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next43, %for.cond2.for.inc21_crit_edge.us ]
  br i1 %4, label %for.cond5.preheader.us.us.preheader, label %for.cond2.for.inc21_crit_edge.us

for.cond5.preheader.us.us.preheader:              ; preds = %for.cond2.preheader.us
  %5 = mul nsw i64 %indvars.iv42, %3
  %6 = trunc i64 %5 to i32
  br label %for.cond5.preheader.us.us

for.cond2.for.inc21_crit_edge.us.loopexit:        ; preds = %for.cond5.for.inc18_crit_edge.us.us
  br label %for.cond2.for.inc21_crit_edge.us

for.cond2.for.inc21_crit_edge.us:                 ; preds = %for.cond2.for.inc21_crit_edge.us.loopexit, %for.cond2.preheader.us
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next43, %wide.trip.count45
  br i1 %exitcond46, label %for.end23.loopexit, label %for.cond2.preheader.us

for.cond5.preheader.us.us:                        ; preds = %for.cond5.preheader.us.us.preheader, %for.cond5.for.inc18_crit_edge.us.us
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %for.cond5.for.inc18_crit_edge.us.us ], [ 0, %for.cond5.preheader.us.us.preheader ]
  %7 = trunc i64 %indvars.iv38 to i32
  %mul81.us.us = add i32 %7, %6
  %add.us.us = mul i32 %mul81.us.us, %np
  %8 = zext i32 %add.us.us to i64
  br label %for.body7.us.us

for.cond5.for.inc18_crit_edge.us.us:              ; preds = %if.end.us.us
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next39, %wide.trip.count40
  br i1 %exitcond41, label %for.cond2.for.inc21_crit_edge.us.loopexit, label %for.cond5.preheader.us.us

for.body7.us.us:                                  ; preds = %if.end.us.us, %for.cond5.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end.us.us ], [ 0, %for.cond5.preheader.us.us ]
  %9 = add i64 %indvars.iv, %8
  %10 = trunc i64 %9 to i32
  %rem.us.us = srem i32 %10, 20
  %cmp11.us.us = icmp eq i32 %rem.us.us, 0
  br i1 %cmp11.us.us, label %if.then.us.us, label %if.end.us.us

if.then.us.us:                                    ; preds = %for.body7.us.us
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #6
  br label %if.end.us.us

if.end.us.us:                                     ; preds = %if.then.us.us, %for.body7.us.us
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv42, i64 %indvars.iv38, i64 %indvars.iv
  %13 = load double, double* %arrayidx16.us.us, align 8
  %call17.us.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond37, label %for.cond5.for.inc18_crit_edge.us.us, label %for.body7.us.us

for.end23.loopexit:                               ; preds = %for.cond2.for.inc21_crit_edge.us
  br label %for.end23

for.end23:                                        ; preds = %for.end23.loopexit, %entry
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %15) #6
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
