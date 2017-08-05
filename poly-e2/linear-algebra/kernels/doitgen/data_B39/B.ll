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
  %cmp47 = icmp sgt i32 %nr, 0
  br i1 %cmp47, label %for.cond1.preheader.lr.ph, label %for.end44

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %wide.trip.count = zext i32 %np to i64
  %2 = shl nsw i64 %0, 3
  %3 = add nsw i64 %0, -1
  %4 = icmp sgt i32 %nq, 0
  %5 = icmp sgt i32 %np, 0
  %6 = icmp eq i32 %np, 0
  %7 = bitcast double* %sum to i8*
  %xtraiter62 = and i64 %0, 3
  %lcmp.mod63 = icmp eq i64 %xtraiter62, 0
  %8 = icmp ult i64 %3, 3
  %xtraiter60 = and i64 %wide.trip.count, 1
  %lcmp.mod61 = icmp eq i64 %xtraiter60, 0
  %9 = icmp eq i32 %np, 1
  %sunkaddr68 = ptrtoint double* %sum to i64
  %10 = add nsw i64 %1, -1
  %xtraiter = and i64 %1, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %11 = icmp ult i64 %10, 7
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.lr.ph, %for.end41
  %12 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %inc43, %for.end41 ]
  br i1 %4, label %for.cond4.preheader.lr.ph, label %for.end41

for.cond4.preheader.lr.ph:                        ; preds = %for.cond1.preheader
  %idxprom10 = sext i32 %12 to i64
  br i1 %5, label %for.cond4.preheader.us.preheader, label %for.cond4.preheader.preheader

for.cond4.preheader.preheader:                    ; preds = %for.cond4.preheader.lr.ph
  br i1 %lcmp.mod, label %for.cond4.preheader.prol.loopexit, label %for.cond4.preheader.prol.preheader

for.cond4.preheader.prol.preheader:               ; preds = %for.cond4.preheader.preheader
  br label %for.cond4.preheader.prol

for.cond4.preheader.prol:                         ; preds = %for.cond4.preheader.prol, %for.cond4.preheader.prol.preheader
  %indvars.iv720.prol = phi i64 [ %indvars.iv.next8.prol, %for.cond4.preheader.prol ], [ 0, %for.cond4.preheader.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.cond4.preheader.prol ], [ %xtraiter, %for.cond4.preheader.prol.preheader ]
  %indvars.iv.next8.prol = add nuw nsw i64 %indvars.iv720.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.cond4.preheader.prol.loopexit.unr-lcssa, label %for.cond4.preheader.prol, !llvm.loop !1

for.cond4.preheader.prol.loopexit.unr-lcssa:      ; preds = %for.cond4.preheader.prol
  br label %for.cond4.preheader.prol.loopexit

for.cond4.preheader.prol.loopexit:                ; preds = %for.cond4.preheader.preheader, %for.cond4.preheader.prol.loopexit.unr-lcssa
  %indvars.iv720.unr = phi i64 [ 0, %for.cond4.preheader.preheader ], [ %indvars.iv.next8.prol, %for.cond4.preheader.prol.loopexit.unr-lcssa ]
  br i1 %11, label %for.end41.loopexit76, label %for.cond4.preheader.preheader.new

for.cond4.preheader.preheader.new:                ; preds = %for.cond4.preheader.prol.loopexit
  br label %for.cond4.preheader

for.cond4.preheader.us.preheader:                 ; preds = %for.cond4.preheader.lr.ph
  br label %for.cond4.preheader.us

for.cond4.preheader.us:                           ; preds = %for.cond4.preheader.us.preheader, %for.end38.us
  %13 = phi i32 [ %split16.us, %for.end38.us ], [ %12, %for.cond4.preheader.us.preheader ]
  %indvars.iv720.us = phi i64 [ %indvars.iv.next8.us, %for.end38.us ], [ 0, %for.cond4.preheader.us.preheader ]
  br i1 %6, label %for.cond4.for.cond25.preheader_crit_edge.us.loopexit, label %for.body6.us25.preheader

for.body6.us25.preheader:                         ; preds = %for.cond4.preheader.us
  %arrayidx15.us30.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom10, i64 %indvars.iv720.us, i64 0
  br label %for.body6.us25

for.end38.us.loopexit:                            ; preds = %for.body27.us
  br label %for.end38.us

for.end38.us:                                     ; preds = %for.end38.us.loopexit, %for.body27.us.prol.loopexit
  %indvars.iv.next8.us = add nuw nsw i64 %indvars.iv720.us, 1
  %exitcond59 = icmp eq i64 %indvars.iv.next8.us, %1
  br i1 %exitcond59, label %for.end41.loopexit, label %for.cond4.preheader.us

for.body27.us:                                    ; preds = %for.body27.us.preheader, %for.body27.us
  %indvars.iv518.us = phi i64 [ %indvars.iv.next6.us.3, %for.body27.us ], [ %indvars.iv518.us.unr, %for.body27.us.preheader ]
  %arrayidx29.us = getelementptr inbounds double, double* %sum, i64 %indvars.iv518.us
  %14 = bitcast double* %arrayidx29.us to i64*
  %15 = load i64, i64* %14, align 8
  %arrayidx35.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv720.us, i64 %indvars.iv518.us
  %16 = bitcast double* %arrayidx35.us to i64*
  store i64 %15, i64* %16, align 8
  %indvars.iv.next6.us = add nuw nsw i64 %indvars.iv518.us, 1
  %arrayidx29.us.1 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next6.us
  %17 = bitcast double* %arrayidx29.us.1 to i64*
  %18 = load i64, i64* %17, align 8
  %arrayidx35.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv720.us, i64 %indvars.iv.next6.us
  %19 = bitcast double* %arrayidx35.us.1 to i64*
  store i64 %18, i64* %19, align 8
  %indvars.iv.next6.us.1 = add nsw i64 %indvars.iv518.us, 2
  %arrayidx29.us.2 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next6.us.1
  %20 = bitcast double* %arrayidx29.us.2 to i64*
  %21 = load i64, i64* %20, align 8
  %arrayidx35.us.2 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv720.us, i64 %indvars.iv.next6.us.1
  %22 = bitcast double* %arrayidx35.us.2 to i64*
  store i64 %21, i64* %22, align 8
  %indvars.iv.next6.us.2 = add nsw i64 %indvars.iv518.us, 3
  %arrayidx29.us.3 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next6.us.2
  %23 = bitcast double* %arrayidx29.us.3 to i64*
  %24 = load i64, i64* %23, align 8
  %arrayidx35.us.3 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv720.us, i64 %indvars.iv.next6.us.2
  %25 = bitcast double* %arrayidx35.us.3 to i64*
  store i64 %24, i64* %25, align 8
  %indvars.iv.next6.us.3 = add nsw i64 %indvars.iv518.us, 4
  %exitcond56.3 = icmp eq i64 %indvars.iv.next6.us.3, %0
  br i1 %exitcond56.3, label %for.end38.us.loopexit, label %for.body27.us

for.body6.us25:                                   ; preds = %for.body6.us25.preheader, %for.cond7.for.end_crit_edge.us42
  %indvars.iv314.us26 = phi i64 [ %indvars.iv.next4.us39, %for.cond7.for.end_crit_edge.us42 ], [ 0, %for.body6.us25.preheader ]
  %arrayidx.us27 = getelementptr inbounds double, double* %sum, i64 %indvars.iv314.us26
  store double 0.000000e+00, double* %arrayidx.us27, align 8
  br i1 %lcmp.mod61, label %for.body9.us28.prol.loopexit, label %for.body9.us28.prol

for.body9.us28.prol:                              ; preds = %for.body6.us25
  %26 = load double, double* %arrayidx15.us30.prol, align 8
  %arrayidx19.us31.prol = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 0, i64 %indvars.iv314.us26
  %27 = load double, double* %arrayidx19.us31.prol, align 8
  %mul.us32.prol = fmul double %26, %27
  %add.us33.prol = fadd double %mul.us32.prol, 0.000000e+00
  %sunkaddr65 = shl i64 %indvars.iv314.us26, 3
  %sunkaddr66 = add i64 %sunkaddr68, %sunkaddr65
  %sunkaddr67 = inttoptr i64 %sunkaddr66 to double*
  store double %add.us33.prol, double* %sunkaddr67, align 8
  br label %for.body9.us28.prol.loopexit

for.body9.us28.prol.loopexit:                     ; preds = %for.body9.us28.prol, %for.body6.us25
  %.unr.ph = phi double [ %add.us33.prol, %for.body9.us28.prol ], [ 0.000000e+00, %for.body6.us25 ]
  %indvars.iv12.us29.unr.ph = phi i64 [ 1, %for.body9.us28.prol ], [ 0, %for.body6.us25 ]
  br i1 %9, label %for.cond7.for.end_crit_edge.us42, label %for.body9.us28.preheader

for.body9.us28.preheader:                         ; preds = %for.body9.us28.prol.loopexit
  %sunkaddr69 = shl i64 %indvars.iv314.us26, 3
  %sunkaddr70 = add i64 %sunkaddr68, %sunkaddr69
  %sunkaddr71 = inttoptr i64 %sunkaddr70 to double*
  br label %for.body9.us28

for.body9.us28:                                   ; preds = %for.body9.us28.preheader, %for.body9.us28
  %28 = phi double [ %add.us33.1, %for.body9.us28 ], [ %.unr.ph, %for.body9.us28.preheader ]
  %indvars.iv12.us29 = phi i64 [ %indvars.iv.next.us34.1, %for.body9.us28 ], [ %indvars.iv12.us29.unr.ph, %for.body9.us28.preheader ]
  %arrayidx15.us30 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom10, i64 %indvars.iv720.us, i64 %indvars.iv12.us29
  %29 = load double, double* %arrayidx15.us30, align 8
  %arrayidx19.us31 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv12.us29, i64 %indvars.iv314.us26
  %30 = load double, double* %arrayidx19.us31, align 8
  %mul.us32 = fmul double %29, %30
  %add.us33 = fadd double %28, %mul.us32
  store double %add.us33, double* %sunkaddr71, align 8
  %indvars.iv.next.us34 = add nuw nsw i64 %indvars.iv12.us29, 1
  %arrayidx15.us30.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom10, i64 %indvars.iv720.us, i64 %indvars.iv.next.us34
  %31 = load double, double* %arrayidx15.us30.1, align 8
  %arrayidx19.us31.1 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv.next.us34, i64 %indvars.iv314.us26
  %32 = load double, double* %arrayidx19.us31.1, align 8
  %mul.us32.1 = fmul double %31, %32
  %add.us33.1 = fadd double %add.us33, %mul.us32.1
  store double %add.us33.1, double* %sunkaddr71, align 8
  %indvars.iv.next.us34.1 = add nsw i64 %indvars.iv12.us29, 2
  %exitcond.us35.1 = icmp eq i64 %indvars.iv.next.us34.1, %wide.trip.count
  br i1 %exitcond.us35.1, label %for.cond7.for.end_crit_edge.us42.loopexit, label %for.body9.us28

for.cond7.for.end_crit_edge.us42.loopexit:        ; preds = %for.body9.us28
  br label %for.cond7.for.end_crit_edge.us42

for.cond7.for.end_crit_edge.us42:                 ; preds = %for.cond7.for.end_crit_edge.us42.loopexit, %for.body9.us28.prol.loopexit
  %indvars.iv.next4.us39 = add nuw nsw i64 %indvars.iv314.us26, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next4.us39, %0
  br i1 %exitcond52, label %for.body27.lr.ph.us.loopexit, label %for.body6.us25

for.cond4.for.cond25.preheader_crit_edge.us.loopexit: ; preds = %for.cond4.preheader.us
  call void @llvm.memset.p0i8.i64(i8* %7, i8 0, i64 %2, i32 8, i1 false)
  br label %for.body27.lr.ph.us

for.body27.lr.ph.us.loopexit:                     ; preds = %for.cond7.for.end_crit_edge.us42
  br label %for.body27.lr.ph.us

for.body27.lr.ph.us:                              ; preds = %for.body27.lr.ph.us.loopexit, %for.cond4.for.cond25.preheader_crit_edge.us.loopexit
  %split16.us = phi i32 [ %13, %for.cond4.for.cond25.preheader_crit_edge.us.loopexit ], [ %12, %for.body27.lr.ph.us.loopexit ]
  %idxprom30.us = sext i32 %split16.us to i64
  br i1 %lcmp.mod63, label %for.body27.us.prol.loopexit, label %for.body27.us.prol.preheader

for.body27.us.prol.preheader:                     ; preds = %for.body27.lr.ph.us
  br label %for.body27.us.prol

for.body27.us.prol:                               ; preds = %for.body27.us.prol.preheader, %for.body27.us.prol
  %indvars.iv518.us.prol = phi i64 [ %indvars.iv.next6.us.prol, %for.body27.us.prol ], [ 0, %for.body27.us.prol.preheader ]
  %prol.iter64 = phi i64 [ %prol.iter64.sub, %for.body27.us.prol ], [ %xtraiter62, %for.body27.us.prol.preheader ]
  %arrayidx29.us.prol = getelementptr inbounds double, double* %sum, i64 %indvars.iv518.us.prol
  %33 = bitcast double* %arrayidx29.us.prol to i64*
  %34 = load i64, i64* %33, align 8
  %arrayidx35.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv720.us, i64 %indvars.iv518.us.prol
  %35 = bitcast double* %arrayidx35.us.prol to i64*
  store i64 %34, i64* %35, align 8
  %indvars.iv.next6.us.prol = add nuw nsw i64 %indvars.iv518.us.prol, 1
  %prol.iter64.sub = add i64 %prol.iter64, -1
  %prol.iter64.cmp = icmp eq i64 %prol.iter64.sub, 0
  br i1 %prol.iter64.cmp, label %for.body27.us.prol.loopexit.loopexit, label %for.body27.us.prol, !llvm.loop !3

for.body27.us.prol.loopexit.loopexit:             ; preds = %for.body27.us.prol
  br label %for.body27.us.prol.loopexit

for.body27.us.prol.loopexit:                      ; preds = %for.body27.us.prol.loopexit.loopexit, %for.body27.lr.ph.us
  %indvars.iv518.us.unr = phi i64 [ 0, %for.body27.lr.ph.us ], [ %indvars.iv.next6.us.prol, %for.body27.us.prol.loopexit.loopexit ]
  br i1 %8, label %for.end38.us, label %for.body27.us.preheader

for.body27.us.preheader:                          ; preds = %for.body27.us.prol.loopexit
  br label %for.body27.us

for.cond4.preheader:                              ; preds = %for.cond4.preheader, %for.cond4.preheader.preheader.new
  %indvars.iv720 = phi i64 [ %indvars.iv720.unr, %for.cond4.preheader.preheader.new ], [ %indvars.iv.next8.7, %for.cond4.preheader ]
  %indvars.iv.next8.7 = add nsw i64 %indvars.iv720, 8
  %exitcond51.7 = icmp eq i64 %indvars.iv.next8.7, %1
  br i1 %exitcond51.7, label %for.end41.loopexit76.unr-lcssa, label %for.cond4.preheader

for.end41.loopexit:                               ; preds = %for.end38.us
  br label %for.end41

for.end41.loopexit76.unr-lcssa:                   ; preds = %for.cond4.preheader
  br label %for.end41.loopexit76

for.end41.loopexit76:                             ; preds = %for.cond4.preheader.prol.loopexit, %for.end41.loopexit76.unr-lcssa
  br label %for.end41

for.end41:                                        ; preds = %for.end41.loopexit76, %for.end41.loopexit, %for.cond1.preheader
  %.lcssa10 = phi i32 [ %12, %for.cond1.preheader ], [ %split16.us, %for.end41.loopexit ], [ %12, %for.end41.loopexit76 ]
  %inc43 = add nsw i32 %.lcssa10, 1
  %cmp = icmp slt i32 %inc43, %nr
  br i1 %cmp, label %for.cond1.preheader, label %for.end44.loopexit

for.end44.loopexit:                               ; preds = %for.end41
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

for.cond1.preheader:                              ; preds = %for.end14, %entry
  %indvars.iv1016 = phi i64 [ 0, %entry ], [ %indvars.iv.next11, %for.end14 ]
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.end, %for.cond1.preheader
  %indvars.iv715 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next8, %for.end ]
  %0 = mul nuw nsw i64 %indvars.iv715, %indvars.iv1016
  br label %for.body6

for.body6:                                        ; preds = %for.body6, %for.cond4.preheader
  %indvars.iv414 = phi i64 [ 0, %for.cond4.preheader ], [ %indvars.iv.next5.1, %for.body6 ]
  %1 = add nuw nsw i64 %indvars.iv414, %0
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 160
  %conv = sitofp i32 %rem to double
  %arrayidx11 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv1016, i64 %indvars.iv715, i64 %indvars.iv414
  %indvars.iv.next5 = or i64 %indvars.iv414, 1
  %3 = add nuw nsw i64 %indvars.iv.next5, %0
  %4 = trunc i64 %3 to i32
  %rem.1 = srem i32 %4, 160
  %conv.1 = sitofp i32 %rem.1 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 1.600000e+02, double 1.600000e+02>
  %5 = bitcast double* %arrayidx11 to <2 x double>*
  store <2 x double> %div, <2 x double>* %5, align 8
  %indvars.iv.next5.1 = add nsw i64 %indvars.iv414, 2
  %exitcond18.1 = icmp eq i64 %indvars.iv.next5.1, 160
  br i1 %exitcond18.1, label %for.end, label %for.body6

for.end:                                          ; preds = %for.body6
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv715, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next8, 140
  br i1 %exitcond19, label %for.end14, label %for.cond4.preheader

for.end14:                                        ; preds = %for.end
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv1016, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next11, 150
  br i1 %exitcond20, label %for.cond22.preheader.preheader, label %for.cond1.preheader

for.cond22.preheader.preheader:                   ; preds = %for.end14
  br label %for.cond22.preheader

for.cond22.preheader:                             ; preds = %for.cond22.preheader.preheader, %for.end37
  %indvars.iv213 = phi i64 [ %indvars.iv.next3, %for.end37 ], [ 0, %for.cond22.preheader.preheader ]
  br label %for.body25

for.body25:                                       ; preds = %for.body25, %for.cond22.preheader
  %indvars.iv12 = phi i64 [ 0, %for.cond22.preheader ], [ %indvars.iv.next.1, %for.body25 ]
  %6 = mul nuw nsw i64 %indvars.iv12, %indvars.iv213
  %7 = trunc i64 %6 to i32
  %rem27 = srem i32 %7, 160
  %conv28 = sitofp i32 %rem27 to double
  %arrayidx34 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv213, i64 %indvars.iv12
  %indvars.iv.next = or i64 %indvars.iv12, 1
  %8 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv213
  %9 = trunc i64 %8 to i32
  %rem27.1 = srem i32 %9, 160
  %conv28.1 = sitofp i32 %rem27.1 to double
  %div30.v.i0.1 = insertelement <2 x double> undef, double %conv28, i32 0
  %div30.v.i0.2 = insertelement <2 x double> %div30.v.i0.1, double %conv28.1, i32 1
  %div30 = fdiv <2 x double> %div30.v.i0.2, <double 1.600000e+02, double 1.600000e+02>
  %10 = bitcast double* %arrayidx34 to <2 x double>*
  store <2 x double> %div30, <2 x double>* %10, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv12, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond.1, label %for.end37, label %for.body25

for.end37:                                        ; preds = %for.body25
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv213, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next3, 160
  br i1 %exitcond17, label %for.end40, label %for.cond22.preheader

for.end40:                                        ; preds = %for.end37
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

for.cond2.preheader:                              ; preds = %for.end20, %entry
  %indvars.iv510 = phi i64 [ 0, %entry ], [ %indvars.iv.next6, %for.end20 ]
  %3 = mul nuw nsw i64 %indvars.iv510, 140
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.end, %for.cond2.preheader
  %indvars.iv39 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next4, %for.end ]
  %mul81 = add nuw nsw i64 %indvars.iv39, %3
  %add = mul nuw nsw i64 %mul81, 160
  br label %for.body7

for.body7:                                        ; preds = %if.end, %for.cond5.preheader
  %indvars.iv8 = phi i64 [ 0, %for.cond5.preheader ], [ %indvars.iv.next, %if.end ]
  %4 = add nuw nsw i64 %indvars.iv8, %add
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp11 = icmp eq i32 %rem, 0
  br i1 %cmp11, label %if.then, label %if.end

if.then:                                          ; preds = %for.body7
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body7
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv510, i64 %indvars.iv39, i64 %indvars.iv8
  %8 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv8, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond, label %for.end, label %for.body7

for.end:                                          ; preds = %if.end
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next4, 140
  br i1 %exitcond11, label %for.end20, label %for.cond5.preheader

for.end20:                                        ; preds = %for.end
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv510, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next6, 150
  br i1 %exitcond12, label %for.end23, label %for.cond2.preheader

for.end23:                                        ; preds = %for.end20
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
