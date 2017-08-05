; ModuleID = 'A.ll'
source_filename = "gramschmidt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"R\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"Q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay3 = bitcast i8* %call1 to [1200 x double]*
  %arraydecay4 = bitcast i8* %call2 to [1200 x double]*
  tail call fastcc void @init_array([1200 x double]* %arraydecay, [1200 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_gramschmidt([1200 x double]* %arraydecay, [1200 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
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
  tail call fastcc void @print_array([1200 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1200 x double]* %A, [1200 x double]* %R, [1200 x double]* %Q) unnamed_addr #2 {
entry:
  br label %for.body3.lr.ph.us

for.body3.lr.ph.us:                               ; preds = %for.end.us, %entry
  %indvars.iv24 = phi i64 [ 0, %entry ], [ %indvars.iv.next25, %for.end.us ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.body3.lr.ph.us
  %indvars.iv17 = phi i64 [ 0, %for.body3.lr.ph.us ], [ %indvars.iv.next18, %for.body3.us ]
  %0 = mul nuw nsw i64 %indvars.iv17, %indvars.iv24
  %1 = trunc i64 %0 to i32
  %rem.us = srem i32 %1, 1000
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.000000e+03
  %mul5.us = fmul double %div.us, 1.000000e+02
  %add.us = fadd double %mul5.us, 1.000000e+01
  %arrayidx7.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv24, i64 %indvars.iv17
  store double %add.us, double* %arrayidx7.us, align 8
  %arrayidx11.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv24, i64 %indvars.iv17
  store double 0.000000e+00, double* %arrayidx11.us, align 8
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond = icmp eq i64 %indvars.iv.next18, 1200
  br i1 %exitcond, label %for.end.us, label %for.body3.us

for.end.us:                                       ; preds = %for.body3.us
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next25, 1000
  br i1 %exitcond31, label %for.body22.lr.ph.us.preheader, label %for.body3.lr.ph.us

for.body22.lr.ph.us.preheader:                    ; preds = %for.end.us
  br label %for.body22.lr.ph.us

for.body22.lr.ph.us:                              ; preds = %for.body22.lr.ph.us, %for.body22.lr.ph.us.preheader
  %indvars.iv13 = phi i64 [ 0, %for.body22.lr.ph.us.preheader ], [ %indvars.iv.next14.3.1, %for.body22.lr.ph.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv13, i64 0
  %scevgep12 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep12, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next14 = or i64 %indvars.iv13, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next14, i64 0
  %scevgep12.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep12.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next14.1 = or i64 %indvars.iv13, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next14.1, i64 0
  %scevgep12.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep12.2, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next14.2 = or i64 %indvars.iv13, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next14.2, i64 0
  %scevgep12.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep12.3, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next14.3 = or i64 %indvars.iv13, 4
  %scevgep.11 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next14.3, i64 0
  %scevgep12.12 = bitcast double* %scevgep.11 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep12.12, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next14.13 = or i64 %indvars.iv13, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next14.13, i64 0
  %scevgep12.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep12.1.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next14.1.1 = or i64 %indvars.iv13, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next14.1.1, i64 0
  %scevgep12.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep12.2.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next14.2.1 = or i64 %indvars.iv13, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next14.2.1, i64 0
  %scevgep12.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep12.3.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next14.3.1 = add nsw i64 %indvars.iv13, 8
  %exitcond16.3.1 = icmp eq i64 %indvars.iv.next14.3.1, 1200
  br i1 %exitcond16.3.1, label %for.end32, label %for.body22.lr.ph.us

for.end32:                                        ; preds = %for.body22.lr.ph.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt([1200 x double]* %A, [1200 x double]* %R, [1200 x double]* %Q) unnamed_addr #0 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end85.for.cond1.preheader_crit_edge, %entry
  %indvars.iv87 = phi i64 [ 0, %entry ], [ %indvars.iv.next88, %for.end85.for.cond1.preheader_crit_edge ]
  %indvars.iv79 = phi i64 [ 1, %entry ], [ %indvars.iv.next80, %for.end85.for.cond1.preheader_crit_edge ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next.3, %for.body3 ]
  %0 = phi double [ 0.000000e+00, %for.cond1.preheader ], [ %add.3, %for.body3 ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv, i64 %indvars.iv87
  %1 = load double, double* %arrayidx5, align 8
  %mul = fmul double %1, %1
  %add = fadd double %0, %mul
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx5.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv87
  %2 = load double, double* %arrayidx5.1, align 8
  %mul.1 = fmul double %2, %2
  %add.1 = fadd double %add, %mul.1
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %arrayidx5.2 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.1, i64 %indvars.iv87
  %3 = load double, double* %arrayidx5.2, align 8
  %mul.2 = fmul double %3, %3
  %add.2 = fadd double %add.1, %mul.2
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %arrayidx5.3 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.2, i64 %indvars.iv87
  %4 = load double, double* %arrayidx5.3, align 8
  %mul.3 = fmul double %4, %4
  %add.3 = fadd double %add.2, %mul.3
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 1000
  br i1 %exitcond.3, label %for.end, label %for.body3

for.end:                                          ; preds = %for.body3
  %call = tail call double @sqrt(double %add.3) #4
  %arrayidx13 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv87, i64 %indvars.iv87
  store double %call, double* %arrayidx13, align 8
  %arrayidx2098 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv87
  %5 = load double, double* %arrayidx2098, align 8
  %div99 = fdiv double %5, %call
  %arrayidx28100 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 0, i64 %indvars.iv87
  store double %div99, double* %arrayidx28100, align 8
  br label %for.body16.for.body16_crit_edge

for.body42.lr.ph.us:                              ; preds = %for.body42.lr.ph.us.preheader, %for.cond33.loopexit.us
  %indvars.iv81 = phi i64 [ %indvars.iv.next82, %for.cond33.loopexit.us ], [ %indvars.iv79, %for.body42.lr.ph.us.preheader ]
  %arrayidx39.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv87, i64 %indvars.iv81
  store double 0.000000e+00, double* %arrayidx39.us, align 8
  br label %for.body42.us

for.body42.us:                                    ; preds = %for.body42.us, %for.body42.lr.ph.us
  %6 = phi double [ 0.000000e+00, %for.body42.lr.ph.us ], [ %add56.us.1, %for.body42.us ]
  %indvars.iv71 = phi i64 [ 0, %for.body42.lr.ph.us ], [ %indvars.iv.next72.1, %for.body42.us ]
  %arrayidx46.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv71, i64 %indvars.iv87
  %7 = load double, double* %arrayidx46.us, align 8
  %arrayidx50.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv71, i64 %indvars.iv81
  %8 = load double, double* %arrayidx50.us, align 8
  %mul51.us = fmul double %7, %8
  %add56.us = fadd double %6, %mul51.us
  store double %add56.us, double* %arrayidx39.us, align 8
  %indvars.iv.next72 = or i64 %indvars.iv71, 1
  %arrayidx46.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next72, i64 %indvars.iv87
  %9 = load double, double* %arrayidx46.us.1, align 8
  %arrayidx50.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next72, i64 %indvars.iv81
  %10 = load double, double* %arrayidx50.us.1, align 8
  %mul51.us.1 = fmul double %9, %10
  %add56.us.1 = fadd double %add56.us, %mul51.us.1
  store double %add56.us.1, double* %arrayidx39.us, align 8
  %indvars.iv.next72.1 = add nuw nsw i64 %indvars.iv71, 2
  %exitcond74.1 = icmp eq i64 %indvars.iv.next72.1, 1000
  br i1 %exitcond74.1, label %for.body62.us.preheader, label %for.body42.us

for.body62.us.preheader:                          ; preds = %for.body42.us
  %arrayidx66.us102 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv81
  %11 = load double, double* %arrayidx66.us102, align 8
  %12 = load double, double* %arrayidx70.us103, align 8
  %mul75.us104 = fmul double %12, %add56.us.1
  %sub.us105 = fsub double %11, %mul75.us104
  store double %sub.us105, double* %arrayidx66.us102, align 8
  br label %for.body62.us.for.body62.us_crit_edge

for.body62.us.for.body62.us_crit_edge:            ; preds = %for.body62.us.for.body62.us_crit_edge.1, %for.body62.us.preheader
  %indvars.iv.next76108 = phi i64 [ 1, %for.body62.us.preheader ], [ %indvars.iv.next76.1, %for.body62.us.for.body62.us_crit_edge.1 ]
  %.pre91 = load double, double* %arrayidx39.us, align 8
  %arrayidx66.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next76108, i64 %indvars.iv81
  %13 = load double, double* %arrayidx66.us, align 8
  %arrayidx70.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next76108, i64 %indvars.iv87
  %14 = load double, double* %arrayidx70.us, align 8
  %mul75.us = fmul double %14, %.pre91
  %sub.us = fsub double %13, %mul75.us
  store double %sub.us, double* %arrayidx66.us, align 8
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv.next76108, 1
  %exitcond78 = icmp eq i64 %indvars.iv.next76, 1000
  br i1 %exitcond78, label %for.cond33.loopexit.us, label %for.body62.us.for.body62.us_crit_edge.1

for.cond33.loopexit.us:                           ; preds = %for.body62.us.for.body62.us_crit_edge
  %indvars.iv.next82 = add nuw nsw i64 %indvars.iv81, 1
  %exitcond = icmp eq i64 %indvars.iv.next82, 1200
  br i1 %exitcond, label %for.end85.loopexit, label %for.body42.lr.ph.us

for.body16.for.cond33.preheader_crit_edge:        ; preds = %for.body16.for.body16_crit_edge
  %indvars.iv.next88 = add nuw nsw i64 %indvars.iv87, 1
  %cmp3421 = icmp slt i64 %indvars.iv.next88, 1200
  br i1 %cmp3421, label %for.body42.lr.ph.us.preheader, label %for.end85

for.body42.lr.ph.us.preheader:                    ; preds = %for.body16.for.cond33.preheader_crit_edge
  %arrayidx70.us103 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 0, i64 %indvars.iv87
  br label %for.body42.lr.ph.us

for.body16.for.body16_crit_edge:                  ; preds = %for.body16.for.body16_crit_edge.1, %for.end
  %indvars.iv.next61101 = phi i64 [ 1, %for.end ], [ %indvars.iv.next61.1, %for.body16.for.body16_crit_edge.1 ]
  %.pre = load double, double* %arrayidx13, align 8
  %arrayidx20 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next61101, i64 %indvars.iv87
  %15 = load double, double* %arrayidx20, align 8
  %div = fdiv double %15, %.pre
  %arrayidx28 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next61101, i64 %indvars.iv87
  store double %div, double* %arrayidx28, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv.next61101, 1
  %exitcond63 = icmp eq i64 %indvars.iv.next61, 1000
  br i1 %exitcond63, label %for.body16.for.cond33.preheader_crit_edge, label %for.body16.for.body16_crit_edge.1

for.end85.loopexit:                               ; preds = %for.cond33.loopexit.us
  br label %for.end85

for.end85:                                        ; preds = %for.end85.loopexit, %for.body16.for.cond33.preheader_crit_edge
  %exitcond90 = icmp eq i64 %indvars.iv.next88, 1200
  br i1 %exitcond90, label %for.end88, label %for.end85.for.cond1.preheader_crit_edge

for.end85.for.cond1.preheader_crit_edge:          ; preds = %for.end85
  %indvars.iv.next80 = add nuw nsw i64 %indvars.iv79, 1
  br label %for.cond1.preheader

for.end88:                                        ; preds = %for.end85
  ret void

for.body16.for.body16_crit_edge.1:                ; preds = %for.body16.for.body16_crit_edge
  %.pre.1 = load double, double* %arrayidx13, align 8
  %arrayidx20.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next61, i64 %indvars.iv87
  %16 = load double, double* %arrayidx20.1, align 8
  %div.1 = fdiv double %16, %.pre.1
  %arrayidx28.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next61, i64 %indvars.iv87
  store double %div.1, double* %arrayidx28.1, align 8
  %indvars.iv.next61.1 = add nsw i64 %indvars.iv.next61101, 2
  br label %for.body16.for.body16_crit_edge

for.body62.us.for.body62.us_crit_edge.1:          ; preds = %for.body62.us.for.body62.us_crit_edge
  %.pre91.1 = load double, double* %arrayidx39.us, align 8
  %arrayidx66.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next76, i64 %indvars.iv81
  %17 = load double, double* %arrayidx66.us.1, align 8
  %arrayidx70.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next76, i64 %indvars.iv87
  %18 = load double, double* %arrayidx70.us.1, align 8
  %mul75.us.1 = fmul double %18, %.pre91.1
  %sub.us.1 = fsub double %17, %mul75.us.1
  store double %sub.us.1, double* %arrayidx66.us.1, align 8
  %indvars.iv.next76.1 = add nsw i64 %indvars.iv.next76108, 2
  br label %for.body62.us.for.body62.us_crit_edge
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* %R, [1200 x double]* %Q) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.body4.lr.ph.us

for.body4.lr.ph.us:                               ; preds = %for.end.us, %entry
  %indvars.iv22 = phi i64 [ 0, %entry ], [ %indvars.iv.next23, %for.end.us ]
  %3 = mul nsw i64 %indvars.iv22, 1200
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.body4.lr.ph.us
  %indvars.iv17 = phi i64 [ 0, %for.body4.lr.ph.us ], [ %indvars.iv.next18, %if.end.us ]
  %4 = add nsw i64 %indvars.iv17, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc6.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv22, i64 %indvars.iv17
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #7
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next18, 1200
  br i1 %exitcond28, label %for.end.us, label %for.body4.us

for.end.us:                                       ; preds = %if.end.us
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next23, 1200
  br i1 %exitcond26, label %for.end12, label %for.body4.lr.ph.us

for.end12:                                        ; preds = %for.end.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  br label %for.body20.lr.ph.us

for.body20.lr.ph.us:                              ; preds = %for.end35.us, %for.end12
  %indvars.iv11 = phi i64 [ 0, %for.end12 ], [ %indvars.iv.next12, %for.end35.us ]
  %11 = mul nsw i64 %indvars.iv11, 1200
  br label %for.body20.us

for.body20.us:                                    ; preds = %if.end27.us, %for.body20.lr.ph.us
  %indvars.iv = phi i64 [ 0, %for.body20.lr.ph.us ], [ %indvars.iv.next, %if.end27.us ]
  %12 = add nsw i64 %indvars.iv, %11
  %13 = trunc i64 %12 to i32
  %rem23.us = srem i32 %13, 20
  %cmp24.us = icmp eq i32 %rem23.us, 0
  br i1 %cmp24.us, label %if.then25.us, label %if.end27.us

if.then25.us:                                     ; preds = %for.body20.us
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #6
  br label %if.end27.us

if.end27.us:                                      ; preds = %for.body20.us, %if.then25.us
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx31.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv11, i64 %indvars.iv
  %16 = load double, double* %arrayidx31.us, align 8
  %call32.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond27, label %for.end35.us, label %for.body20.us

for.end35.us:                                     ; preds = %if.end27.us
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond = icmp eq i64 %indvars.iv.next12, 1000
  br i1 %exitcond, label %for.end38, label %for.body20.lr.ph.us

for.end38:                                        ; preds = %for.end35.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call39 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
