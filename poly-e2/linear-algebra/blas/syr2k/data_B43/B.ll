; ModuleID = 'A.ll'
source_filename = "syr2k.c"
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
  %call = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay3 = bitcast i8* %call1 to [1000 x double]*
  %arraydecay4 = bitcast i8* %call2 to [1000 x double]*
  call fastcc void @init_array(i32 1200, i32 1000, double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1000 x double]* %arraydecay4)
  call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  call fastcc void @kernel_syr2k(i32 1200, i32 1000, double %0, double %1, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1000 x double]* %arraydecay4)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %2, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %3 = bitcast i8* %call to [1200 x double]*
  call fastcc void @print_array(i32 1200, [1200 x double]* %3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, i32 %m, double* nocapture %alpha, double* nocapture %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture %A, [1000 x double]* nocapture %B) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.body

for.body:                                         ; preds = %for.end, %entry
  %indvars.iv1118 = phi i64 [ 0, %entry ], [ %indvars.iv.next12, %for.end ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.body
  %indvars.iv516 = phi i64 [ 0, %for.body ], [ %indvars.iv.next6, %for.body3 ]
  %0 = mul nuw nsw i64 %indvars.iv516, %indvars.iv1118
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 1200
  %conv = sitofp i32 %rem to double
  %arrayidx6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1118, i64 %indvars.iv516
  %3 = add nuw nsw i64 %0, 2
  %4 = trunc i64 %3 to i32
  %rem9 = srem i32 %4, 1000
  %conv10 = sitofp i32 %rem9 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv10, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 1.200000e+03, double 1.000000e+03>
  %div.v.r1 = extractelement <2 x double> %div, i32 0
  %div.v.r2 = extractelement <2 x double> %div, i32 1
  store double %div.v.r1, double* %arrayidx6, align 8
  %arrayidx16 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv1118, i64 %indvars.iv516
  store double %div.v.r2, double* %arrayidx16, align 8
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv516, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next6, 1000
  br i1 %exitcond21, label %for.end, label %for.body3

for.end:                                          ; preds = %for.body3
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv1118, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next12, 1200
  br i1 %exitcond22, label %for.body23.preheader, label %for.body

for.body23.preheader:                             ; preds = %for.end
  br label %for.body23

for.body23:                                       ; preds = %for.body23.preheader, %for.end40
  %indvars.iv314 = phi i64 [ %indvars.iv.next4, %for.end40 ], [ 0, %for.body23.preheader ]
  br label %for.body27

for.body27:                                       ; preds = %for.body27, %for.body23
  %indvars.iv13 = phi i64 [ 0, %for.body23 ], [ %indvars.iv.next, %for.body27 ]
  %5 = mul nuw nsw i64 %indvars.iv13, %indvars.iv314
  %6 = add nuw nsw i64 %5, 3
  %7 = trunc i64 %6 to i32
  %rem30 = srem i32 %7, 1200
  %conv31 = sitofp i32 %rem30 to double
  %div33 = fdiv double %conv31, 1.000000e+03
  %arrayidx37 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv314, i64 %indvars.iv13
  store double %div33, double* %arrayidx37, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.end40, label %for.body27

for.end40:                                        ; preds = %for.body27
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv314, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next4, 1200
  br i1 %exitcond20, label %for.end43, label %for.body23

for.end43:                                        ; preds = %for.end40
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(i32 %n, i32 %m, double %alpha, double %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture readonly %A, [1000 x double]* nocapture readonly %B) unnamed_addr #2 {
entry:
  %broadcast.splatinsert51 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat52 = shufflevector <2 x double> %broadcast.splatinsert51, <2 x double> undef, <2 x i32> zeroinitializer
  %0 = insertelement <2 x double> undef, double %beta, i32 0
  %mul.v.i1.2 = shufflevector <2 x double> %0, <2 x double> undef, <2 x i32> zeroinitializer
  %1 = insertelement <2 x double> undef, double %beta, i32 0
  %mul.2.v.i1.2 = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body

for.body:                                         ; preds = %for.end42, %entry
  %indvars.iv1122 = phi i64 [ 1, %entry ], [ %indvars.iv.next12, %for.end42 ]
  %indvars.iv1321 = phi i64 [ 0, %entry ], [ %indvars.iv.next14, %for.end42 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv1321, i64 0
  %2 = mul i64 %indvars.iv1321, 1201
  %3 = add i64 %2, 1
  %scevgep27 = getelementptr [1200 x double], [1200 x double]* %C, i64 0, i64 %3
  %4 = add i64 %indvars.iv1321, 1
  %5 = add i64 %indvars.iv1321, 1
  %xtraiter = and i64 %5, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body3.prol.loopexit, label %for.body3.prol.preheader

for.body3.prol.preheader:                         ; preds = %for.body
  br label %for.body3.prol

for.body3.prol:                                   ; preds = %for.body3.prol.preheader, %for.body3.prol
  %indvars.iv15.prol = phi i64 [ %indvars.iv.next.prol, %for.body3.prol ], [ 0, %for.body3.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body3.prol ], [ %xtraiter, %for.body3.prol.preheader ]
  %arrayidx5.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1321, i64 %indvars.iv15.prol
  %6 = load double, double* %arrayidx5.prol, align 8
  %mul.prol = fmul double %6, %beta
  store double %mul.prol, double* %arrayidx5.prol, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv15.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body3.prol.loopexit.loopexit, label %for.body3.prol, !llvm.loop !1

for.body3.prol.loopexit.loopexit:                 ; preds = %for.body3.prol
  br label %for.body3.prol.loopexit

for.body3.prol.loopexit:                          ; preds = %for.body3.prol.loopexit.loopexit, %for.body
  %indvars.iv15.unr = phi i64 [ 0, %for.body ], [ %indvars.iv.next.prol, %for.body3.prol.loopexit.loopexit ]
  %7 = icmp ult i64 %indvars.iv1321, 3
  br i1 %7, label %for.body8.preheader, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.body3.prol.loopexit
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader, %for.body3
  %indvars.iv15 = phi i64 [ %indvars.iv.next.3, %for.body3 ], [ %indvars.iv15.unr, %for.body3.preheader ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1321, i64 %indvars.iv15
  %8 = bitcast double* %arrayidx5 to <2 x double>*
  %9 = load <2 x double>, <2 x double>* %8, align 8
  %mul = fmul <2 x double> %9, %mul.v.i1.2
  %10 = bitcast double* %arrayidx5 to <2 x double>*
  store <2 x double> %mul, <2 x double>* %10, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv15, 2
  %arrayidx5.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1321, i64 %indvars.iv.next.1
  %11 = bitcast double* %arrayidx5.2 to <2 x double>*
  %12 = load <2 x double>, <2 x double>* %11, align 8
  %mul.2 = fmul <2 x double> %12, %mul.2.v.i1.2
  %13 = bitcast double* %arrayidx5.2 to <2 x double>*
  store <2 x double> %mul.2, <2 x double>* %13, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv15, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv1122
  br i1 %exitcond.3, label %for.body8.preheader.loopexit, label %for.body3

for.body8.preheader.loopexit:                     ; preds = %for.body3
  br label %for.body8.preheader

for.body8.preheader:                              ; preds = %for.body8.preheader.loopexit, %for.body3.prol.loopexit
  %min.iters.check = icmp ult i64 %4, 2
  %n.vec = and i64 %4, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %4, %n.vec
  br label %for.body8

for.body8:                                        ; preds = %for.body8.preheader, %for.end39
  %indvars.iv919 = phi i64 [ %indvars.iv.next10, %for.end39 ], [ 0, %for.body8.preheader ]
  %scevgep29 = getelementptr [1000 x double], [1000 x double]* %A, i64 0, i64 %indvars.iv919
  %14 = add i64 %indvars.iv919, 1
  %scevgep31 = getelementptr [1000 x double], [1000 x double]* %A, i64 %indvars.iv1321, i64 %14
  %scevgep33 = getelementptr [1000 x double], [1000 x double]* %B, i64 0, i64 %indvars.iv919
  %scevgep35 = getelementptr [1000 x double], [1000 x double]* %B, i64 %indvars.iv1321, i64 %14
  %arrayidx20 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv1321, i64 %indvars.iv919
  %arrayidx30 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1321, i64 %indvars.iv919
  br i1 %min.iters.check, label %for.body11.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body8
  br i1 %cmp.zero, label %for.body11.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %arrayidx30
  %bound1 = icmp ult double* %arrayidx30, %scevgep27
  %found.conflict = and i1 %bound0, %bound1
  %bound038 = icmp ult double* %scevgep, %scevgep31
  %bound139 = icmp ult double* %scevgep29, %scevgep27
  %found.conflict40 = and i1 %bound038, %bound139
  %conflict.rdx = or i1 %found.conflict, %found.conflict40
  %bound041 = icmp ult double* %scevgep, %scevgep35
  %bound142 = icmp ult double* %scevgep33, %scevgep27
  %found.conflict43 = and i1 %bound041, %bound142
  %conflict.rdx44 = or i1 %conflict.rdx, %found.conflict43
  %bound047 = icmp ult double* %scevgep, %arrayidx20
  %bound148 = icmp ult double* %arrayidx20, %scevgep27
  %found.conflict49 = and i1 %bound047, %bound148
  %conflict.rdx50 = or i1 %conflict.rdx44, %found.conflict49
  br i1 %conflict.rdx50, label %for.body11.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %15 = or i64 %index, 1
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %index, i64 %indvars.iv919
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %15, i64 %indvars.iv919
  %18 = load double, double* %16, align 8, !alias.scope !3
  %19 = load double, double* %17, align 8, !alias.scope !3
  %20 = insertelement <2 x double> undef, double %18, i32 0
  %21 = insertelement <2 x double> %20, double %19, i32 1
  %22 = fmul <2 x double> %21, %broadcast.splat52
  %23 = load double, double* %arrayidx20, align 8, !alias.scope !6
  %24 = insertelement <2 x double> undef, double %23, i32 0
  %25 = shufflevector <2 x double> %24, <2 x double> undef, <2 x i32> zeroinitializer
  %26 = fmul <2 x double> %22, %25
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %index, i64 %indvars.iv919
  %28 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %15, i64 %indvars.iv919
  %29 = load double, double* %27, align 8, !alias.scope !8
  %30 = load double, double* %28, align 8, !alias.scope !8
  %31 = insertelement <2 x double> undef, double %29, i32 0
  %32 = insertelement <2 x double> %31, double %30, i32 1
  %33 = fmul <2 x double> %32, %broadcast.splat52
  %34 = load double, double* %arrayidx30, align 8, !alias.scope !10
  %35 = insertelement <2 x double> undef, double %34, i32 0
  %36 = shufflevector <2 x double> %35, <2 x double> undef, <2 x i32> zeroinitializer
  %37 = fmul <2 x double> %33, %36
  %38 = fadd <2 x double> %26, %37
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1321, i64 %index
  %40 = bitcast double* %39 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %40, align 8, !alias.scope !12, !noalias !14
  %41 = fadd <2 x double> %wide.load, %38
  %42 = bitcast double* %39 to <2 x double>*
  store <2 x double> %41, <2 x double>* %42, align 8, !alias.scope !12, !noalias !14
  %index.next = add i64 %index, 2
  %43 = icmp eq i64 %index.next, %n.vec
  br i1 %43, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.end39, label %for.body11.preheader

for.body11.preheader:                             ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.body8
  %indvars.iv317.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.body8 ], [ %n.vec, %middle.block ]
  br label %for.body11

for.body11:                                       ; preds = %for.body11.preheader, %for.body11
  %indvars.iv317 = phi i64 [ %indvars.iv.next4, %for.body11 ], [ %indvars.iv317.ph, %for.body11.preheader ]
  %arrayidx15 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv317, i64 %indvars.iv919
  %44 = load double, double* %arrayidx15, align 8
  %mul16 = fmul double %44, %alpha
  %45 = load double, double* %arrayidx20, align 8
  %mul21 = fmul double %mul16, %45
  %arrayidx25 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv317, i64 %indvars.iv919
  %46 = load double, double* %arrayidx25, align 8
  %mul26 = fmul double %46, %alpha
  %47 = load double, double* %arrayidx30, align 8
  %mul31 = fmul double %mul26, %47
  %add = fadd double %mul21, %mul31
  %arrayidx35 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1321, i64 %indvars.iv317
  %48 = load double, double* %arrayidx35, align 8
  %add36 = fadd double %48, %add
  store double %add36, double* %arrayidx35, align 8
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv317, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next4, %indvars.iv1122
  br i1 %exitcond8, label %for.end39.loopexit, label %for.body11, !llvm.loop !18

for.end39.loopexit:                               ; preds = %for.body11
  br label %for.end39

for.end39:                                        ; preds = %for.end39.loopexit, %middle.block
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv919, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next10, 1000
  br i1 %exitcond24, label %for.end42, label %for.body8

for.end42:                                        ; preds = %for.end39
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv1321, 1
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv1122, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next14, 1200
  br i1 %exitcond25, label %for.end45, label %for.body

for.end45:                                        ; preds = %for.end42
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [1200 x double]* nocapture readonly %C) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body

for.body:                                         ; preds = %for.end, %entry
  %indvars.iv26 = phi i64 [ 0, %entry ], [ %indvars.iv.next3, %for.end ]
  %3 = mul nuw nsw i64 %indvars.iv26, 1200
  br label %for.body4

for.body4:                                        ; preds = %if.end, %for.body
  %indvars.iv5 = phi i64 [ 0, %for.body ], [ %indvars.iv.next, %if.end ]
  %4 = add nuw nsw i64 %indvars.iv5, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end

if.end:                                           ; preds = %for.body4, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv26, i64 %indvars.iv5
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.end, label %for.body4

for.end:                                          ; preds = %if.end
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next3, 1200
  br i1 %exitcond8, label %for.end12, label %for.body

for.end12:                                        ; preds = %for.end
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
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
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7}
!7 = distinct !{!7, !5}
!8 = !{!9}
!9 = distinct !{!9, !5}
!10 = !{!11}
!11 = distinct !{!11, !5}
!12 = !{!13}
!13 = distinct !{!13, !5}
!14 = !{!11, !4, !9, !7}
!15 = distinct !{!15, !16, !17}
!16 = !{!"llvm.loop.vectorize.width", i32 1}
!17 = !{!"llvm.loop.interleave.count", i32 1}
!18 = distinct !{!18, !16, !17}
