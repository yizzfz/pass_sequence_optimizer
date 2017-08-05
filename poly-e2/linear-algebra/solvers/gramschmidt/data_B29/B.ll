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
  tail call fastcc void @print_array([1200 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1200 x double]* nocapture %A, [1200 x double]* nocapture %R, [1200 x double]* nocapture %Q) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %entry, %for.cond1.for.inc12_crit_edge.us
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %for.cond1.for.inc12_crit_edge.us ], [ 0, %entry ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv15 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next16, %for.body3.us ]
  %0 = mul nuw nsw i64 %indvars.iv15, %indvars.iv20
  %1 = trunc i64 %0 to i32
  %rem.us = srem i32 %1, 1000
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.000000e+03
  %mul5.us = fmul double %div.us, 1.000000e+02
  %add.us = fadd double %mul5.us, 1.000000e+01
  %arrayidx7.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv20, i64 %indvars.iv15
  store double %add.us, double* %arrayidx7.us, align 8
  %arrayidx11.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv20, i64 %indvars.iv15
  store double 0.000000e+00, double* %arrayidx11.us, align 8
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next16, 1200
  br i1 %exitcond19, label %for.cond1.for.inc12_crit_edge.us, label %for.body3.us

for.cond1.for.inc12_crit_edge.us:                 ; preds = %for.body3.us
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next21, 1000
  br i1 %exitcond23, label %for.cond19.for.inc30_crit_edge.us.3.preheader, label %for.cond1.preheader.us

for.cond19.for.inc30_crit_edge.us.3.preheader:    ; preds = %for.cond1.for.inc12_crit_edge.us
  br label %for.cond19.for.inc30_crit_edge.us.3

for.end32:                                        ; preds = %for.cond19.for.inc30_crit_edge.us.3
  ret void

for.cond19.for.inc30_crit_edge.us.3:              ; preds = %for.cond19.for.inc30_crit_edge.us.3, %for.cond19.for.inc30_crit_edge.us.3.preheader
  %indvars.iv11 = phi i64 [ 0, %for.cond19.for.inc30_crit_edge.us.3.preheader ], [ %indvars.iv.next12.3.1, %for.cond19.for.inc30_crit_edge.us.3 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv11, i64 0
  %scevgep25 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next12 = or i64 %indvars.iv11, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next12, i64 0
  %scevgep25.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next12.1 = or i64 %indvars.iv11, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next12.1, i64 0
  %scevgep25.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.2, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next12.2 = or i64 %indvars.iv11, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next12.2, i64 0
  %scevgep25.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.3, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next12.3 = or i64 %indvars.iv11, 4
  %scevgep.11 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next12.3, i64 0
  %scevgep25.12 = bitcast double* %scevgep.11 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.12, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next12.13 = or i64 %indvars.iv11, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next12.13, i64 0
  %scevgep25.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.1.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next12.1.1 = or i64 %indvars.iv11, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next12.1.1, i64 0
  %scevgep25.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.2.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next12.2.1 = or i64 %indvars.iv11, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next12.2.1, i64 0
  %scevgep25.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.3.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next12.3.1 = add nuw nsw i64 %indvars.iv11, 8
  %exitcond14.3.1 = icmp eq i64 %indvars.iv.next12.3.1, 1200
  br i1 %exitcond14.3.1, label %for.end32, label %for.cond19.for.inc30_crit_edge.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt([1200 x double]* nocapture %A, [1200 x double]* nocapture %R, [1200 x double]* nocapture %Q) unnamed_addr #0 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc86, %entry
  %indvars.iv72 = phi i64 [ 0, %entry ], [ %5, %for.inc86 ]
  %indvars.iv66 = phi i64 [ 1, %entry ], [ %indvars.iv.next67, %for.inc86 ]
  br label %for.inc

for.inc:                                          ; preds = %for.cond1.preheader, %for.inc
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc ], [ 0, %for.cond1.preheader ]
  %nrm.03 = phi double [ %add.3, %for.inc ], [ 0.000000e+00, %for.cond1.preheader ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv, i64 %indvars.iv72
  %0 = load double, double* %arrayidx5, align 8
  %mul = fmul double %0, %0
  %add = fadd double %nrm.03, %mul
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx5.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv72
  %1 = load double, double* %arrayidx5.1, align 8
  %mul.1 = fmul double %1, %1
  %add.1 = fadd double %add, %mul.1
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %arrayidx5.2 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.1, i64 %indvars.iv72
  %2 = load double, double* %arrayidx5.2, align 8
  %mul.2 = fmul double %2, %2
  %add.2 = fadd double %add.1, %mul.2
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %arrayidx5.3 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.2, i64 %indvars.iv72
  %3 = load double, double* %arrayidx5.3, align 8
  %mul.3 = fmul double %3, %3
  %add.3 = fadd double %add.2, %mul.3
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 1000
  br i1 %exitcond.3, label %for.end, label %for.inc

for.end:                                          ; preds = %for.inc
  %call = tail call double @sqrt(double %add.3) #4
  %arrayidx13 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv72, i64 %indvars.iv72
  store double %call, double* %arrayidx13, align 8
  %arrayidx2085 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv72
  %4 = load double, double* %arrayidx2085, align 8
  %div86 = fdiv double %4, %call
  %arrayidx2887 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 0, i64 %indvars.iv72
  store double %div86, double* %arrayidx2887, align 8
  br label %for.body16.for.body16_crit_edge

for.cond33.preheader:                             ; preds = %for.body16.for.body16_crit_edge
  %5 = add nuw nsw i64 %indvars.iv72, 1
  %cmp3411 = icmp slt i64 %5, 1200
  br i1 %cmp3411, label %for.body35.us.preheader, label %for.inc86

for.body35.us.preheader:                          ; preds = %for.cond33.preheader
  %arrayidx70.us91 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 0, i64 %indvars.iv72
  br label %for.body35.us

for.body35.us:                                    ; preds = %for.body35.us.preheader, %for.cond33.loopexit.us
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %for.cond33.loopexit.us ], [ %indvars.iv66, %for.body35.us.preheader ]
  %arrayidx39.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv72, i64 %indvars.iv68
  store double 0.000000e+00, double* %arrayidx39.us, align 8
  br label %for.body42.us

for.body62.us.preheader:                          ; preds = %for.body42.us
  %arrayidx66.us90 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv68
  %6 = load double, double* %arrayidx66.us90, align 8
  %7 = load double, double* %arrayidx70.us91, align 8
  %mul75.us92 = fmul double %7, %add56.us.1
  %sub.us93 = fsub double %6, %mul75.us92
  store double %sub.us93, double* %arrayidx66.us90, align 8
  br label %for.body62.us.for.body62.us_crit_edge

for.body62.us.for.body62.us_crit_edge:            ; preds = %for.body62.us.for.body62.us_crit_edge.1, %for.body62.us.preheader
  %indvars.iv6295 = phi i64 [ 0, %for.body62.us.preheader ], [ %indvars.iv.next63.1, %for.body62.us.for.body62.us_crit_edge.1 ]
  %indvars.iv.next63 = or i64 %indvars.iv6295, 1
  %.pre45 = load double, double* %arrayidx39.us, align 8
  %arrayidx66.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next63, i64 %indvars.iv68
  %8 = load double, double* %arrayidx66.us, align 8
  %arrayidx70.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next63, i64 %indvars.iv72
  %9 = load double, double* %arrayidx70.us, align 8
  %mul75.us = fmul double %9, %.pre45
  %sub.us = fsub double %8, %mul75.us
  store double %sub.us, double* %arrayidx66.us, align 8
  %exitcond65 = icmp eq i64 %indvars.iv.next63, 999
  br i1 %exitcond65, label %for.cond33.loopexit.us, label %for.body62.us.for.body62.us_crit_edge.1

for.body42.us:                                    ; preds = %for.body35.us, %for.body42.us
  %indvars.iv58 = phi i64 [ %indvars.iv.next59.1, %for.body42.us ], [ 0, %for.body35.us ]
  %10 = phi double [ %add56.us.1, %for.body42.us ], [ 0.000000e+00, %for.body35.us ]
  %arrayidx46.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv58, i64 %indvars.iv72
  %11 = load double, double* %arrayidx46.us, align 8
  %arrayidx50.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv68
  %12 = load double, double* %arrayidx50.us, align 8
  %mul51.us = fmul double %11, %12
  %add56.us = fadd double %10, %mul51.us
  store double %add56.us, double* %arrayidx39.us, align 8
  %indvars.iv.next59 = or i64 %indvars.iv58, 1
  %arrayidx46.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next59, i64 %indvars.iv72
  %13 = load double, double* %arrayidx46.us.1, align 8
  %arrayidx50.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next59, i64 %indvars.iv68
  %14 = load double, double* %arrayidx50.us.1, align 8
  %mul51.us.1 = fmul double %13, %14
  %add56.us.1 = fadd double %add56.us, %mul51.us.1
  store double %add56.us.1, double* %arrayidx39.us, align 8
  %indvars.iv.next59.1 = add nuw nsw i64 %indvars.iv58, 2
  %exitcond61.1 = icmp eq i64 %indvars.iv.next59.1, 1000
  br i1 %exitcond61.1, label %for.body62.us.preheader, label %for.body42.us

for.cond33.loopexit.us:                           ; preds = %for.body62.us.for.body62.us_crit_edge
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next69, 1200
  br i1 %exitcond71, label %for.inc86.loopexit, label %for.body35.us

for.body16.for.body16_crit_edge:                  ; preds = %for.body16.for.body16_crit_edge.1, %for.end
  %indvars.iv4889 = phi i64 [ 0, %for.end ], [ %indvars.iv.next49.1, %for.body16.for.body16_crit_edge.1 ]
  %indvars.iv.next49 = or i64 %indvars.iv4889, 1
  %.pre = load double, double* %arrayidx13, align 8
  %arrayidx20 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next49, i64 %indvars.iv72
  %15 = load double, double* %arrayidx20, align 8
  %div = fdiv double %15, %.pre
  %arrayidx28 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next49, i64 %indvars.iv72
  store double %div, double* %arrayidx28, align 8
  %exitcond51 = icmp eq i64 %indvars.iv.next49, 999
  br i1 %exitcond51, label %for.cond33.preheader, label %for.body16.for.body16_crit_edge.1

for.inc86.loopexit:                               ; preds = %for.cond33.loopexit.us
  br label %for.inc86

for.inc86:                                        ; preds = %for.inc86.loopexit, %for.cond33.preheader
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond75 = icmp eq i64 %5, 1200
  br i1 %exitcond75, label %for.end88, label %for.cond1.preheader

for.end88:                                        ; preds = %for.inc86
  ret void

for.body16.for.body16_crit_edge.1:                ; preds = %for.body16.for.body16_crit_edge
  %indvars.iv.next49.1 = add nuw nsw i64 %indvars.iv4889, 2
  %.pre.1 = load double, double* %arrayidx13, align 8
  %arrayidx20.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next49.1, i64 %indvars.iv72
  %16 = load double, double* %arrayidx20.1, align 8
  %div.1 = fdiv double %16, %.pre.1
  %arrayidx28.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next49.1, i64 %indvars.iv72
  store double %div.1, double* %arrayidx28.1, align 8
  br label %for.body16.for.body16_crit_edge

for.body62.us.for.body62.us_crit_edge.1:          ; preds = %for.body62.us.for.body62.us_crit_edge
  %indvars.iv.next63.1 = add nuw nsw i64 %indvars.iv6295, 2
  %.pre45.1 = load double, double* %arrayidx39.us, align 8
  %arrayidx66.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next63.1, i64 %indvars.iv68
  %17 = load double, double* %arrayidx66.us.1, align 8
  %arrayidx70.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next63.1, i64 %indvars.iv72
  %18 = load double, double* %arrayidx70.us.1, align 8
  %mul75.us.1 = fmul double %18, %.pre45.1
  %sub.us.1 = fsub double %17, %mul75.us.1
  store double %sub.us.1, double* %arrayidx66.us.1, align 8
  br label %for.body62.us.for.body62.us_crit_edge
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly %R, [1200 x double]* nocapture readonly %Q) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %indvars.iv25 = phi i64 [ 0, %entry ], [ %indvars.iv.next26, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nuw nsw i64 %indvars.iv25, 1200
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv20 = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next21, %if.end.us ]
  %4 = add nuw nsw i64 %indvars.iv20, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6
  br label %if.end.us

if.end.us:                                        ; preds = %if.then.us, %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv25, i64 %indvars.iv20
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next21, 1200
  br i1 %exitcond24, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next26, 1200
  br i1 %exitcond29, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  br label %for.cond18.preheader.us

for.cond18.preheader.us:                          ; preds = %for.cond18.for.inc36_crit_edge.us, %for.end12
  %indvars.iv14 = phi i64 [ 0, %for.end12 ], [ %indvars.iv.next15, %for.cond18.for.inc36_crit_edge.us ]
  %11 = mul nuw nsw i64 %indvars.iv14, 1200
  br label %for.body20.us

for.body20.us:                                    ; preds = %if.end27.us, %for.cond18.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond18.preheader.us ], [ %indvars.iv.next, %if.end27.us ]
  %12 = add nuw nsw i64 %indvars.iv, %11
  %13 = trunc i64 %12 to i32
  %rem23.us = srem i32 %13, 20
  %cmp24.us = icmp eq i32 %rem23.us, 0
  br i1 %cmp24.us, label %if.then25.us, label %if.end27.us

if.then25.us:                                     ; preds = %for.body20.us
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #6
  br label %if.end27.us

if.end27.us:                                      ; preds = %if.then25.us, %for.body20.us
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx31.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv14, i64 %indvars.iv
  %16 = load double, double* %arrayidx31.us, align 8
  %call32.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond18.for.inc36_crit_edge.us, label %for.body20.us

for.cond18.for.inc36_crit_edge.us:                ; preds = %if.end27.us
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next15, 1000
  br i1 %exitcond18, label %for.end38, label %for.cond18.preheader.us

for.end38:                                        ; preds = %for.cond18.for.inc36_crit_edge.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call39 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
