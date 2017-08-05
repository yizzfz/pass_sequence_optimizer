; ModuleID = 'A.ll'
source_filename = "gemm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1100000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1100 x double]*
  %arraydecay3 = bitcast i8* %call1 to [1200 x double]*
  %arraydecay4 = bitcast i8* %call2 to [1100 x double]*
  call fastcc void @init_array(i32 1000, i32 1100, i32 1200, double* nonnull %alpha, double* nonnull %beta, [1100 x double]* %arraydecay, [1200 x double]* %arraydecay3, [1100 x double]* %arraydecay4)
  tail call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  tail call fastcc void @kernel_gemm(i32 1000, i32 1100, i32 1200, double %0, double %1, [1100 x double]* %arraydecay, [1200 x double]* %arraydecay3, [1100 x double]* %arraydecay4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %2, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call fastcc void @print_array(i32 1000, i32 1100, [1100 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %ni, i32 %nj, i32 %nk, double* nocapture %alpha, double* nocapture %beta, [1100 x double]* nocapture %C, [1200 x double]* nocapture %A, [1100 x double]* nocapture %B) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %entry, %for.cond1.for.inc7_crit_edge.us
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %for.cond1.for.inc7_crit_edge.us ], [ 0, %entry ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv60 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next61, %for.body3.us ]
  %0 = mul nuw nsw i64 %indvars.iv60, %indvars.iv66
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, 1000
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.000000e+03
  %arrayidx6.us = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv66, i64 %indvars.iv60
  store double %div.us, double* %arrayidx6.us, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next61, 1100
  br i1 %exitcond65, label %for.cond1.for.inc7_crit_edge.us, label %for.body3.us

for.cond1.for.inc7_crit_edge.us:                  ; preds = %for.body3.us
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond69 = icmp eq i64 %indvars.iv.next67, 1000
  br i1 %exitcond69, label %for.cond14.preheader.us.preheader, label %for.cond1.preheader.us

for.cond14.preheader.us.preheader:                ; preds = %for.cond1.for.inc7_crit_edge.us
  br label %for.cond14.preheader.us

for.cond14.preheader.us:                          ; preds = %for.cond14.preheader.us.preheader, %for.cond14.for.inc31_crit_edge.us
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %for.cond14.for.inc31_crit_edge.us ], [ 0, %for.cond14.preheader.us.preheader ]
  br label %for.body17.us

for.body17.us:                                    ; preds = %for.cond14.preheader.us, %for.body17.us
  %indvars.iv50 = phi i64 [ %indvars.iv.next51.1, %for.body17.us ], [ 0, %for.cond14.preheader.us ]
  %indvars.iv.next51 = or i64 %indvars.iv50, 1
  %3 = mul nuw nsw i64 %indvars.iv.next51, %indvars.iv55
  %4 = trunc i64 %3 to i32
  %rem20.us = srem i32 %4, 1200
  %conv21.us = sitofp i32 %rem20.us to double
  %arrayidx27.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv55, i64 %indvars.iv50
  %indvars.iv.next51.1 = add nsw i64 %indvars.iv50, 2
  %5 = mul nuw nsw i64 %indvars.iv.next51.1, %indvars.iv55
  %6 = trunc i64 %5 to i32
  %rem20.us.1 = srem i32 %6, 1200
  %conv21.us.1 = sitofp i32 %rem20.us.1 to double
  %div23.us.v.i0.1 = insertelement <2 x double> undef, double %conv21.us, i32 0
  %div23.us.v.i0.2 = insertelement <2 x double> %div23.us.v.i0.1, double %conv21.us.1, i32 1
  %div23.us = fdiv <2 x double> %div23.us.v.i0.2, <double 1.200000e+03, double 1.200000e+03>
  %7 = bitcast double* %arrayidx27.us to <2 x double>*
  store <2 x double> %div23.us, <2 x double>* %7, align 8
  %exitcond54.1 = icmp eq i64 %indvars.iv.next51.1, 1200
  br i1 %exitcond54.1, label %for.cond14.for.inc31_crit_edge.us, label %for.body17.us

for.cond14.for.inc31_crit_edge.us:                ; preds = %for.body17.us
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next56, 1000
  br i1 %exitcond58, label %for.cond38.preheader.us.preheader, label %for.cond14.preheader.us

for.cond38.preheader.us.preheader:                ; preds = %for.cond14.for.inc31_crit_edge.us
  br label %for.cond38.preheader.us

for.cond38.preheader.us:                          ; preds = %for.cond38.preheader.us.preheader, %for.cond38.for.inc55_crit_edge.us
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %for.cond38.for.inc55_crit_edge.us ], [ 0, %for.cond38.preheader.us.preheader ]
  br label %for.body41.us

for.body41.us:                                    ; preds = %for.body41.us, %for.cond38.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond38.preheader.us ], [ %indvars.iv.next, %for.body41.us ]
  %8 = add nuw nsw i64 %indvars.iv, 2
  %9 = mul nuw nsw i64 %8, %indvars.iv45
  %10 = trunc i64 %9 to i32
  %rem44.us = srem i32 %10, 1100
  %conv45.us = sitofp i32 %rem44.us to double
  %div47.us = fdiv double %conv45.us, 1.100000e+03
  %arrayidx51.us = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv45, i64 %indvars.iv
  store double %div47.us, double* %arrayidx51.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %for.cond38.for.inc55_crit_edge.us, label %for.body41.us

for.cond38.for.inc55_crit_edge.us:                ; preds = %for.body41.us
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next46, 1200
  br i1 %exitcond48, label %for.end57, label %for.cond38.preheader.us

for.end57:                                        ; preds = %for.cond38.for.inc55_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemm(i32 %ni, i32 %nj, i32 %nk, double %alpha, double %beta, [1100 x double]* %C, [1200 x double]* readonly %A, [1100 x double]* readonly %B) unnamed_addr #2 {
entry:
  %0 = insertelement <2 x double> undef, double %beta, i32 0
  %mul.us.v.i1.2 = shufflevector <2 x double> %0, <2 x double> undef, <2 x i32> zeroinitializer
  %1 = insertelement <2 x double> undef, double %beta, i32 0
  %mul.us.2.v.i1.2 = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert142 = insertelement <2 x double> undef, double %alpha, i32 0
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc32.us, %entry
  %indvars.iv55 = phi i64 [ 0, %entry ], [ %indvars.iv.next56, %for.inc32.us ]
  br label %for.body3.us

for.inc32.us:                                     ; preds = %for.cond9.for.inc29_crit_edge.us.us
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next56, 1000
  br i1 %exitcond58, label %for.end34, label %for.cond1.preheader.us

for.body3.us:                                     ; preds = %for.body3.us.1, %for.cond1.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next.3.1, %for.body3.us.1 ]
  %arrayidx5.us = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv55, i64 %indvars.iv
  %2 = bitcast double* %arrayidx5.us to <2 x double>*
  %3 = load <2 x double>, <2 x double>* %2, align 8
  %mul.us = fmul <2 x double> %3, %mul.us.v.i1.2
  %4 = bitcast double* %arrayidx5.us to <2 x double>*
  store <2 x double> %mul.us, <2 x double>* %4, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %arrayidx5.us.2 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv55, i64 %indvars.iv.next.1
  %5 = bitcast double* %arrayidx5.us.2 to <2 x double>*
  %6 = load <2 x double>, <2 x double>* %5, align 8
  %mul.us.2 = fmul <2 x double> %6, %mul.us.2.v.i1.2
  %7 = bitcast double* %arrayidx5.us.2 to <2 x double>*
  store <2 x double> %mul.us.2, <2 x double>* %7, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 1100
  br i1 %exitcond.3, label %for.cond9.preheader.us.us.preheader, label %for.body3.us.1

for.cond9.preheader.us.us.preheader:              ; preds = %for.body3.us
  %scevgep110 = getelementptr [1100 x double], [1100 x double]* %C, i64 %indvars.iv55, i64 0
  %scevgep113 = getelementptr [1100 x double], [1100 x double]* %C, i64 %indvars.iv55, i64 1100
  br label %for.cond9.preheader.us.us

for.cond9.preheader.us.us:                        ; preds = %for.cond9.preheader.us.us.preheader, %for.cond9.for.inc29_crit_edge.us.us
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %for.cond9.for.inc29_crit_edge.us.us ], [ 0, %for.cond9.preheader.us.us.preheader ]
  %arrayidx15.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv55, i64 %indvars.iv52
  %scevgep116 = getelementptr [1100 x double], [1100 x double]* %B, i64 %indvars.iv52, i64 0
  %scevgep119 = getelementptr [1100 x double], [1100 x double]* %B, i64 %indvars.iv52, i64 1100
  %bound0123 = icmp ult double* %scevgep110, %arrayidx15.us.us
  %bound1124 = icmp ult double* %arrayidx15.us.us, %scevgep113
  %found.conflict125 = and i1 %bound0123, %bound1124
  %bound0126 = icmp ult double* %scevgep110, %scevgep119
  %bound1127 = icmp ult double* %scevgep116, %scevgep113
  %found.conflict128 = and i1 %bound0126, %bound1127
  %conflict.rdx129 = or i1 %found.conflict125, %found.conflict128
  br i1 %conflict.rdx129, label %for.body11.us.us.preheader, label %vector.ph132

for.body11.us.us.preheader:                       ; preds = %middle.block101, %for.cond9.preheader.us.us
  %indvars.iv46.ph = phi i64 [ 0, %for.cond9.preheader.us.us ], [ 1100, %middle.block101 ]
  br label %for.body11.us.us

vector.ph132:                                     ; preds = %for.cond9.preheader.us.us
  br label %vector.body100

vector.body100:                                   ; preds = %vector.body100, %vector.ph132
  %index133 = phi i64 [ 0, %vector.ph132 ], [ %index.next134, %vector.body100 ]
  %8 = shl i64 %index133, 1
  %9 = load double, double* %arrayidx15.us.us, align 8, !alias.scope !1
  %10 = insertelement <2 x double> undef, double %9, i32 0
  %11 = fmul <2 x double> %10, %broadcast.splatinsert142
  %12 = shufflevector <2 x double> %11, <2 x double> undef, <2 x i32> zeroinitializer
  %13 = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv52, i64 %8
  %14 = bitcast double* %13 to <4 x double>*
  %wide.vec144 = load <4 x double>, <4 x double>* %14, align 8, !alias.scope !4
  %strided.vec145 = shufflevector <4 x double> %wide.vec144, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec146 = shufflevector <4 x double> %wide.vec144, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %15 = fmul <2 x double> %12, %strided.vec145
  %16 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv55, i64 %8
  %17 = bitcast double* %16 to <4 x double>*
  %wide.vec147 = load <4 x double>, <4 x double>* %17, align 8, !alias.scope !6, !noalias !8
  %strided.vec148 = shufflevector <4 x double> %wide.vec147, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec149 = shufflevector <4 x double> %wide.vec147, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %18 = fadd <2 x double> %strided.vec148, %15
  %19 = or i64 %8, 1
  %20 = load double, double* %arrayidx15.us.us, align 8, !alias.scope !1
  %21 = insertelement <2 x double> undef, double %20, i32 0
  %22 = fmul <2 x double> %21, %broadcast.splatinsert142
  %23 = shufflevector <2 x double> %22, <2 x double> undef, <2 x i32> zeroinitializer
  %24 = fmul <2 x double> %23, %strided.vec146
  %25 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv55, i64 %19
  %26 = fadd <2 x double> %strided.vec149, %24
  %27 = getelementptr double, double* %25, i64 -1
  %28 = bitcast double* %27 to <4 x double>*
  %interleaved.vec150 = shufflevector <2 x double> %18, <2 x double> %26, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec150, <4 x double>* %28, align 8, !alias.scope !6, !noalias !8
  %index.next134 = add i64 %index133, 2
  %29 = icmp eq i64 %index.next134, 550
  br i1 %29, label %middle.block101, label %vector.body100, !llvm.loop !9

middle.block101:                                  ; preds = %vector.body100
  br i1 true, label %for.cond9.for.inc29_crit_edge.us.us, label %for.body11.us.us.preheader

for.cond9.for.inc29_crit_edge.us.us.loopexit:     ; preds = %for.body11.us.us
  br label %for.cond9.for.inc29_crit_edge.us.us

for.cond9.for.inc29_crit_edge.us.us:              ; preds = %for.cond9.for.inc29_crit_edge.us.us.loopexit, %middle.block101
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond = icmp eq i64 %indvars.iv.next53, 1200
  br i1 %exitcond, label %for.inc32.us, label %for.cond9.preheader.us.us

for.body11.us.us:                                 ; preds = %for.body11.us.us.preheader, %for.body11.us.us
  %indvars.iv46 = phi i64 [ %indvars.iv.next47.1, %for.body11.us.us ], [ %indvars.iv46.ph, %for.body11.us.us.preheader ]
  %30 = load double, double* %arrayidx15.us.us, align 8
  %mul16.us.us = fmul double %30, %alpha
  %arrayidx20.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv52, i64 %indvars.iv46
  %31 = load double, double* %arrayidx20.us.us, align 8
  %mul21.us.us = fmul double %mul16.us.us, %31
  %arrayidx25.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv55, i64 %indvars.iv46
  %32 = load double, double* %arrayidx25.us.us, align 8
  %add.us.us = fadd double %32, %mul21.us.us
  store double %add.us.us, double* %arrayidx25.us.us, align 8
  %indvars.iv.next47 = or i64 %indvars.iv46, 1
  %33 = load double, double* %arrayidx15.us.us, align 8
  %mul16.us.us.1 = fmul double %33, %alpha
  %arrayidx20.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv52, i64 %indvars.iv.next47
  %34 = load double, double* %arrayidx20.us.us.1, align 8
  %mul21.us.us.1 = fmul double %mul16.us.us.1, %34
  %arrayidx25.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv55, i64 %indvars.iv.next47
  %35 = load double, double* %arrayidx25.us.us.1, align 8
  %add.us.us.1 = fadd double %35, %mul21.us.us.1
  store double %add.us.us.1, double* %arrayidx25.us.us.1, align 8
  %indvars.iv.next47.1 = add nsw i64 %indvars.iv46, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next47.1, 1100
  br i1 %exitcond.1, label %for.cond9.for.inc29_crit_edge.us.us.loopexit, label %for.body11.us.us, !llvm.loop !12

for.end34:                                        ; preds = %for.inc32.us
  ret void

for.body3.us.1:                                   ; preds = %for.body3.us
  %arrayidx5.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv55, i64 %indvars.iv.next.3
  %36 = bitcast double* %arrayidx5.us.1 to <2 x double>*
  %37 = load <2 x double>, <2 x double>* %36, align 8
  %mul.us.1 = fmul <2 x double> %37, %mul.us.v.i1.2
  %38 = bitcast double* %arrayidx5.us.1 to <2 x double>*
  store <2 x double> %mul.us.1, <2 x double>* %38, align 8
  %indvars.iv.next.1.1 = or i64 %indvars.iv, 6
  %arrayidx5.us.2.1 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv55, i64 %indvars.iv.next.1.1
  %39 = bitcast double* %arrayidx5.us.2.1 to <2 x double>*
  %40 = load <2 x double>, <2 x double>* %39, align 8
  %mul.us.2.1 = fmul <2 x double> %40, %mul.us.2.v.i1.2
  %41 = bitcast double* %arrayidx5.us.2.1 to <2 x double>*
  store <2 x double> %mul.us.2.1, <2 x double>* %41, align 8
  %indvars.iv.next.3.1 = add nsw i64 %indvars.iv, 8
  br label %for.body3.us
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %ni, i32 %nj, [1100 x double]* nocapture readonly %C) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %indvars.iv12 = phi i64 [ 0, %entry ], [ %indvars.iv.next13, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv12, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %if.end.us ]
  %4 = add nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end.us

if.end.us:                                        ; preds = %if.then.us, %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv12, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next13, 1000
  br i1 %exitcond16, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
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
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = !{!7}
!7 = distinct !{!7, !3}
!8 = !{!2, !5}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.vectorize.width", i32 1}
!11 = !{!"llvm.loop.interleave.count", i32 1}
!12 = distinct !{!12, !10, !11}
