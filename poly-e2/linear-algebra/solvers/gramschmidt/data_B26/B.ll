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
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
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
  %1 = bitcast i8* %call2 to [1200 x double]*
  %2 = bitcast i8* %call1 to [1200 x double]*
  tail call fastcc void @print_array([1200 x double]* %2, [1200 x double]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1200 x double]* nocapture %A, [1200 x double]* nocapture %R, [1200 x double]* nocapture %Q) unnamed_addr #2 {
for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge:
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc12.us, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge
  %indvars.iv718.us = phi i64 [ 0, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge ], [ %indvars.iv.next8.us, %for.inc12.us ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv315.us = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next4.us, %for.body3.us ]
  %0 = mul nuw nsw i64 %indvars.iv315.us, %indvars.iv718.us
  %1 = trunc i64 %0 to i32
  %rem.us = srem i32 %1, 1000
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.000000e+03
  %mul5.us = fmul double %div.us, 1.000000e+02
  %add.us = fadd double %mul5.us, 1.000000e+01
  %arrayidx7.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv718.us, i64 %indvars.iv315.us
  store double %add.us, double* %arrayidx7.us, align 8
  %arrayidx11.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv718.us, i64 %indvars.iv315.us
  store double 0.000000e+00, double* %arrayidx11.us, align 8
  %exitcond21 = icmp eq i64 %indvars.iv315.us, 1199
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv315.us, 1
  br i1 %exitcond21, label %for.inc12.us, label %for.body3.us

for.inc12.us:                                     ; preds = %for.body3.us
  %indvars.iv.next8.us = add nuw nsw i64 %indvars.iv718.us, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next8.us, 1000
  br i1 %exitcond26, label %for.cond19.preheader.preheader, label %for.cond1.preheader.us

for.cond19.preheader.preheader:                   ; preds = %for.inc12.us
  br label %for.cond19.preheader

for.cond19.preheader:                             ; preds = %for.cond19.preheader, %for.cond19.preheader.preheader
  %indvars.iv112 = phi i64 [ 0, %for.cond19.preheader.preheader ], [ %indvars.iv.next2.7, %for.cond19.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv112, i64 0
  %scevgep20 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep20, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next2 = or i64 %indvars.iv112, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next2, i64 0
  %scevgep20.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep20.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next2.1 = or i64 %indvars.iv112, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next2.1, i64 0
  %scevgep20.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep20.2, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next2.2 = or i64 %indvars.iv112, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next2.2, i64 0
  %scevgep20.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep20.3, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next2.3 = or i64 %indvars.iv112, 4
  %scevgep.4 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next2.3, i64 0
  %scevgep20.4 = bitcast double* %scevgep.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep20.4, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next2.4 = or i64 %indvars.iv112, 5
  %scevgep.5 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next2.4, i64 0
  %scevgep20.5 = bitcast double* %scevgep.5 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep20.5, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next2.5 = or i64 %indvars.iv112, 6
  %scevgep.6 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next2.5, i64 0
  %scevgep20.6 = bitcast double* %scevgep.6 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep20.6, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next2.6 = or i64 %indvars.iv112, 7
  %scevgep.7 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next2.6, i64 0
  %scevgep20.7 = bitcast double* %scevgep.7 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep20.7, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next2.7 = add nsw i64 %indvars.iv112, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next2.7, 1200
  br i1 %exitcond.7, label %for.end32, label %for.cond19.preheader

for.end32:                                        ; preds = %for.cond19.preheader
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt([1200 x double]* nocapture %A, [1200 x double]* nocapture %R, [1200 x double]* nocapture %Q) unnamed_addr #0 {
for.cond1.preheader.lr.ph:
  br label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.cond1.preheader.lr.ph, %for.inc86
  %indvars.iv1126 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next1022, %for.inc86 ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.body3.preheader
  %nrm.015 = phi double [ 0.000000e+00, %for.body3.preheader ], [ %add.4, %for.body3 ]
  %indvars.iv14 = phi i64 [ 0, %for.body3.preheader ], [ %indvars.iv.next.4, %for.body3 ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv14, i64 %indvars.iv1126
  %0 = load double, double* %arrayidx5, align 8
  %mul = fmul double %0, %0
  %add = fadd double %nrm.015, %mul
  %indvars.iv.next = add nuw nsw i64 %indvars.iv14, 1
  %arrayidx5.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv1126
  %1 = load double, double* %arrayidx5.1, align 8
  %mul.1 = fmul double %1, %1
  %add.1 = fadd double %add, %mul.1
  %indvars.iv.next.1 = add nsw i64 %indvars.iv14, 2
  %arrayidx5.2 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.1, i64 %indvars.iv1126
  %2 = load double, double* %arrayidx5.2, align 8
  %mul.2 = fmul double %2, %2
  %add.2 = fadd double %add.1, %mul.2
  %indvars.iv.next.2 = add nsw i64 %indvars.iv14, 3
  %arrayidx5.3 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.2, i64 %indvars.iv1126
  %3 = load double, double* %arrayidx5.3, align 8
  %mul.3 = fmul double %3, %3
  %add.3 = fadd double %add.2, %mul.3
  %indvars.iv.next.3 = add nsw i64 %indvars.iv14, 4
  %arrayidx5.4 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.3, i64 %indvars.iv1126
  %4 = load double, double* %arrayidx5.4, align 8
  %mul.4 = fmul double %4, %4
  %add.4 = fadd double %add.3, %mul.4
  %exitcond55.4 = icmp eq i64 %indvars.iv.next.3, 999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv14, 5
  br i1 %exitcond55.4, label %for.body16.preheader, label %for.body3

for.body16.preheader:                             ; preds = %for.body3
  %call = tail call double @sqrt(double %add.4) #4
  %arrayidx13 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv1126, i64 %indvars.iv1126
  store double %call, double* %arrayidx13, align 8
  %arrayidx2064 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv1126
  %5 = load double, double* %arrayidx2064, align 8
  %div65 = fdiv double %5, %call
  %arrayidx2866 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 0, i64 %indvars.iv1126
  store double %div65, double* %arrayidx2866, align 8
  br label %for.body16.for.body16_crit_edge

for.cond33.preheader:                             ; preds = %for.body16.for.body16_crit_edge
  %indvars.iv.next1022 = add nuw nsw i64 %indvars.iv1126, 1
  %exitcond23 = icmp eq i64 %indvars.iv1126, 1199
  br i1 %exitcond23, label %for.inc86, label %for.body35.us.preheader

for.body35.us.preheader:                          ; preds = %for.cond33.preheader
  br label %for.body35.us

for.body35.us:                                    ; preds = %for.body35.us.preheader, %for.cond33.loopexit.us
  %indvars.iv.next1024.us = phi i64 [ %indvars.iv.next10.us, %for.cond33.loopexit.us ], [ %indvars.iv.next1022, %for.body35.us.preheader ]
  %arrayidx39.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv1126, i64 %indvars.iv.next1024.us
  store double 0.000000e+00, double* %arrayidx39.us, align 8
  br label %for.body42.us

for.body42.us:                                    ; preds = %for.body42.us, %for.body35.us
  %6 = phi double [ 0.000000e+00, %for.body35.us ], [ %add56.us.1, %for.body42.us ]
  %indvars.iv319.us = phi i64 [ 0, %for.body35.us ], [ %indvars.iv.next4.us.1, %for.body42.us ]
  %arrayidx46.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv319.us, i64 %indvars.iv1126
  %7 = load double, double* %arrayidx46.us, align 8
  %arrayidx50.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv319.us, i64 %indvars.iv.next1024.us
  %8 = load double, double* %arrayidx50.us, align 8
  %mul51.us = fmul double %7, %8
  %add56.us = fadd double %6, %mul51.us
  store double %add56.us, double* %arrayidx39.us, align 8
  %indvars.iv.next4.us = or i64 %indvars.iv319.us, 1
  %arrayidx46.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next4.us, i64 %indvars.iv1126
  %9 = load double, double* %arrayidx46.us.1, align 8
  %arrayidx50.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next4.us, i64 %indvars.iv.next1024.us
  %10 = load double, double* %arrayidx50.us.1, align 8
  %mul51.us.1 = fmul double %9, %10
  %add56.us.1 = fadd double %add56.us, %mul51.us.1
  store double %add56.us.1, double* %arrayidx39.us, align 8
  %exitcond59.1 = icmp eq i64 %indvars.iv.next4.us, 999
  %indvars.iv.next4.us.1 = add nsw i64 %indvars.iv319.us, 2
  br i1 %exitcond59.1, label %for.body62.us.preheader, label %for.body42.us

for.body62.us.preheader:                          ; preds = %for.body42.us
  %arrayidx66.us68 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv.next1024.us
  %11 = load double, double* %arrayidx66.us68, align 8
  %sunkaddr = ptrtoint [1200 x double]* %Q to i64
  %sunkaddr1 = mul i64 %indvars.iv1126, 8
  %sunkaddr2 = add i64 %sunkaddr, %sunkaddr1
  %sunkaddr3 = inttoptr i64 %sunkaddr2 to double*
  %12 = load double, double* %sunkaddr3, align 8
  %mul75.us70 = fmul double %12, %add56.us.1
  %sub.us71 = fsub double %11, %mul75.us70
  store double %sub.us71, double* %arrayidx66.us68, align 8
  br label %for.body62.us.for.body62.us_crit_edge

for.body62.us.for.body62.us_crit_edge:            ; preds = %for.body62.us.for.body62.us_crit_edge.1, %for.body62.us.preheader
  %indvars.iv521.us72 = phi i64 [ 0, %for.body62.us.preheader ], [ %indvars.iv.next6.us.1, %for.body62.us.for.body62.us_crit_edge.1 ]
  %indvars.iv.next6.us = or i64 %indvars.iv521.us72, 1
  %.pre61 = load double, double* %arrayidx39.us, align 8
  %arrayidx66.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next6.us, i64 %indvars.iv.next1024.us
  %13 = load double, double* %arrayidx66.us, align 8
  %arrayidx70.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next6.us, i64 %indvars.iv1126
  %14 = load double, double* %arrayidx70.us, align 8
  %mul75.us = fmul double %14, %.pre61
  %sub.us = fsub double %13, %mul75.us
  store double %sub.us, double* %arrayidx66.us, align 8
  %exitcond60 = icmp eq i64 %indvars.iv.next6.us, 999
  br i1 %exitcond60, label %for.cond33.loopexit.us, label %for.body62.us.for.body62.us_crit_edge.1

for.cond33.loopexit.us:                           ; preds = %for.body62.us.for.body62.us_crit_edge
  %exitcond.us = icmp eq i64 %indvars.iv.next1024.us, 1199
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv.next1024.us, 1
  br i1 %exitcond.us, label %for.inc86, label %for.body35.us

for.body16.for.body16_crit_edge:                  ; preds = %for.body16.for.body16_crit_edge.1, %for.body16.preheader
  %indvars.iv11767 = phi i64 [ 0, %for.body16.preheader ], [ %indvars.iv.next2.1, %for.body16.for.body16_crit_edge.1 ]
  %indvars.iv.next2 = or i64 %indvars.iv11767, 1
  %.pre = load double, double* %arrayidx13, align 8
  %arrayidx20 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next2, i64 %indvars.iv1126
  %15 = load double, double* %arrayidx20, align 8
  %div = fdiv double %15, %.pre
  %arrayidx28 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next2, i64 %indvars.iv1126
  store double %div, double* %arrayidx28, align 8
  %exitcond56 = icmp eq i64 %indvars.iv.next2, 999
  br i1 %exitcond56, label %for.cond33.preheader, label %for.body16.for.body16_crit_edge.1

for.inc86:                                        ; preds = %for.cond33.loopexit.us, %for.cond33.preheader
  %exitcond = icmp eq i64 %indvars.iv.next1022, 1200
  br i1 %exitcond, label %for.end88, label %for.body3.preheader

for.end88:                                        ; preds = %for.inc86
  ret void

for.body16.for.body16_crit_edge.1:                ; preds = %for.body16.for.body16_crit_edge
  %indvars.iv.next2.1 = add nsw i64 %indvars.iv11767, 2
  %.pre.1 = load double, double* %arrayidx13, align 8
  %arrayidx20.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next2.1, i64 %indvars.iv1126
  %16 = load double, double* %arrayidx20.1, align 8
  %div.1 = fdiv double %16, %.pre.1
  %arrayidx28.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next2.1, i64 %indvars.iv1126
  store double %div.1, double* %arrayidx28.1, align 8
  br label %for.body16.for.body16_crit_edge

for.body62.us.for.body62.us_crit_edge.1:          ; preds = %for.body62.us.for.body62.us_crit_edge
  %indvars.iv.next6.us.1 = add nsw i64 %indvars.iv521.us72, 2
  %.pre61.1 = load double, double* %arrayidx39.us, align 8
  %arrayidx66.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next6.us.1, i64 %indvars.iv.next1024.us
  %17 = load double, double* %arrayidx66.us.1, align 8
  %arrayidx70.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next6.us.1, i64 %indvars.iv1126
  %18 = load double, double* %arrayidx70.us.1, align 8
  %mul75.us.1 = fmul double %18, %.pre61.1
  %sub.us.1 = fsub double %17, %mul75.us.1
  store double %sub.us.1, double* %arrayidx66.us.1, align 8
  br label %for.body62.us.for.body62.us_crit_edge
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly %R, [1200 x double]* nocapture readonly %Q) unnamed_addr #0 {
for.cond2.preheader.lr.ph.for.cond2.preheader_crit_edge:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %for.cond2.preheader.lr.ph.for.cond2.preheader_crit_edge
  %indvars.iv822 = phi i64 [ 0, %for.cond2.preheader.lr.ph.for.cond2.preheader_crit_edge ], [ %indvars.iv.next9, %for.inc10 ]
  %3 = mul nuw nsw i64 %indvars.iv822, 1200
  br label %for.body4

for.body4:                                        ; preds = %if.end, %for.cond2.preheader
  %indvars.iv520 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next6, %if.end ]
  %4 = add nuw nsw i64 %indvars.iv520, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc13 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6
  br label %if.end

if.end:                                           ; preds = %for.body4, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv822, i64 %indvars.iv520
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #7
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv520, 1
  %exitcond = icmp eq i64 %indvars.iv.next6, 1200
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %if.end
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv822, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next9, 1200
  br i1 %exitcond4, label %for.cond18.preheader.us.preheader, label %for.cond2.preheader

for.cond18.preheader.us.preheader:                ; preds = %for.inc10
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  br label %for.cond18.preheader.us

for.cond18.preheader.us:                          ; preds = %for.cond18.preheader.us.preheader, %for.inc36.us
  %indvars.iv217.us = phi i64 [ %indvars.iv.next3.us, %for.inc36.us ], [ 0, %for.cond18.preheader.us.preheader ]
  %11 = mul nuw nsw i64 %indvars.iv217.us, 1200
  br label %for.body20.us

for.body20.us:                                    ; preds = %if.end27.us, %for.cond18.preheader.us
  %indvars.iv15.us = phi i64 [ 0, %for.cond18.preheader.us ], [ %indvars.iv.next.us, %if.end27.us ]
  %12 = add nuw nsw i64 %indvars.iv15.us, %11
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
  %arrayidx31.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv217.us, i64 %indvars.iv15.us
  %16 = load double, double* %arrayidx31.us, align 8
  %call32.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #7
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv15.us, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond2, label %for.inc36.us, label %for.body20.us

for.inc36.us:                                     ; preds = %if.end27.us
  %indvars.iv.next3.us = add nuw nsw i64 %indvars.iv217.us, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next3.us, 1000
  br i1 %exitcond3, label %for.end38, label %for.cond18.preheader.us

for.end38:                                        ; preds = %for.inc36.us
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
