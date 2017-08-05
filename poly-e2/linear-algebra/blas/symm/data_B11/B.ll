; ModuleID = 'A.ll'
source_filename = "symm.c"
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
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay3 = bitcast i8* %call1 to [1000 x double]*
  %arraydecay4 = bitcast i8* %call2 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  call fastcc void @kernel_symm(i32 1000, i32 1200, double %0, double %1, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
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
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %m, i32 %n, double* %alpha, double* %beta, [1200 x double]* %C, [1000 x double]* %A, [1200 x double]* %B) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc16_crit_edge.us, %entry
  %indvars.iv67 = phi i64 [ 0, %entry ], [ %indvars.iv.next68, %for.cond1.for.inc16_crit_edge.us ]
  %0 = add i64 %indvars.iv67, 1200
  %1 = trunc i64 %0 to i32
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv62 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next63, %for.body3.us ]
  %2 = add nuw nsw i64 %indvars.iv62, %indvars.iv67
  %3 = trunc i64 %2 to i32
  %rem.us = srem i32 %3, 100
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.000000e+03
  %arrayidx6.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv67, i64 %indvars.iv62
  store double %div.us, double* %arrayidx6.us, align 8
  %4 = trunc i64 %indvars.iv62 to i32
  %sub.us = sub i32 %1, %4
  %rem8.us = srem i32 %sub.us, 100
  %conv9.us = sitofp i32 %rem8.us to double
  %div11.us = fdiv double %conv9.us, 1.000000e+03
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv67, i64 %indvars.iv62
  store double %div11.us, double* %arrayidx15.us, align 8
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %exitcond = icmp eq i64 %indvars.iv.next63, 1200
  br i1 %exitcond, label %for.cond1.for.inc16_crit_edge.us, label %for.body3.us

for.cond1.for.inc16_crit_edge.us:                 ; preds = %for.body3.us
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond79 = icmp eq i64 %indvars.iv.next68, 1000
  br i1 %exitcond79, label %for.body26.lr.ph.preheader, label %for.cond1.preheader.us

for.body26.lr.ph.preheader:                       ; preds = %for.cond1.for.inc16_crit_edge.us
  br label %for.body26.lr.ph

for.cond19.loopexit.loopexit:                     ; preds = %for.body43
  br label %for.cond19.loopexit

for.cond19.loopexit:                              ; preds = %for.cond19.loopexit.loopexit, %middle.block, %for.body43.prol.loopexit, %for.end38
  %indvars.iv.next76 = add nuw i64 %indvars.iv75, 1
  %exitcond61 = icmp eq i64 %9, 1000
  br i1 %exitcond61, label %for.end53, label %for.body26.lr.ph

for.body26.lr.ph:                                 ; preds = %for.body26.lr.ph.preheader, %for.cond19.loopexit
  %indvars.iv77.in = phi i3 [ %indvars.iv77, %for.cond19.loopexit ], [ 0, %for.body26.lr.ph.preheader ]
  %indvars.iv75 = phi i64 [ %indvars.iv.next76, %for.cond19.loopexit ], [ 1, %for.body26.lr.ph.preheader ]
  %indvars.iv58 = phi i64 [ %9, %for.cond19.loopexit ], [ 0, %for.body26.lr.ph.preheader ]
  %indvars.iv77 = add i3 %indvars.iv77.in, -1
  %5 = zext i3 %indvars.iv77 to i64
  %6 = add i64 %indvars.iv75, %5
  %7 = sub i64 1007, %indvars.iv58
  %8 = sub i64 998, %indvars.iv58
  %9 = add nuw i64 %indvars.iv58, 1
  %xtraiter = and i64 %9, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body26.prol.loopexit.unr-lcssa, label %for.body26.prol.preheader

for.body26.prol.preheader:                        ; preds = %for.body26.lr.ph
  %10 = trunc i64 %indvars.iv58 to i32
  %rem28.prol = srem i32 %10, 100
  %conv29.prol = sitofp i32 %rem28.prol to double
  %div31.prol = fdiv double %conv29.prol, 1.000000e+03
  %arrayidx35.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv58, i64 0
  store double %div31.prol, double* %arrayidx35.prol, align 8
  br label %for.body26.prol.loopexit.unr-lcssa

for.body26.prol.loopexit.unr-lcssa:               ; preds = %for.body26.lr.ph, %for.body26.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body26.prol.preheader ], [ 0, %for.body26.lr.ph ]
  %11 = icmp eq i64 %indvars.iv58, 0
  br i1 %11, label %for.end38, label %for.body26.preheader

for.body26.preheader:                             ; preds = %for.body26.prol.loopexit.unr-lcssa
  br label %for.body26

for.body26:                                       ; preds = %for.body26.preheader, %for.body26
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body26 ], [ %indvars.iv.unr.ph, %for.body26.preheader ]
  %12 = add nuw nsw i64 %indvars.iv, %indvars.iv58
  %13 = trunc i64 %12 to i32
  %rem28 = srem i32 %13, 100
  %conv29 = sitofp i32 %rem28 to double
  %div31 = fdiv double %conv29, 1.000000e+03
  %arrayidx35 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv
  store double %div31, double* %arrayidx35, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %14 = add nuw nsw i64 %indvars.iv.next, %indvars.iv58
  %15 = trunc i64 %14 to i32
  %rem28.1 = srem i32 %15, 100
  %conv29.1 = sitofp i32 %rem28.1 to double
  %div31.1 = fdiv double %conv29.1, 1.000000e+03
  %arrayidx35.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv.next
  store double %div31.1, double* %arrayidx35.1, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond49.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv75
  br i1 %exitcond49.1, label %for.end38.loopexit, label %for.body26

for.end38.loopexit:                               ; preds = %for.body26
  br label %for.end38

for.end38:                                        ; preds = %for.end38.loopexit, %for.body26.prol.loopexit.unr-lcssa
  %cmp4132 = icmp slt i64 %9, 1000
  br i1 %cmp4132, label %for.body43.lr.ph, label %for.cond19.loopexit

for.body43.lr.ph:                                 ; preds = %for.end38
  %xtraiter72 = and i64 %7, 7
  %lcmp.mod73 = icmp eq i64 %xtraiter72, 0
  br i1 %lcmp.mod73, label %for.body43.prol.loopexit, label %for.body43.prol.preheader

for.body43.prol.preheader:                        ; preds = %for.body43.lr.ph
  br label %for.body43.prol

for.body43.prol:                                  ; preds = %for.body43.prol.preheader, %for.body43.prol
  %indvars.iv52.prol = phi i64 [ %indvars.iv.next53.prol, %for.body43.prol ], [ %indvars.iv75, %for.body43.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body43.prol ], [ %xtraiter72, %for.body43.prol.preheader ]
  %arrayidx47.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv52.prol
  store double -9.990000e+02, double* %arrayidx47.prol, align 8
  %indvars.iv.next53.prol = add nuw nsw i64 %indvars.iv52.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body43.prol.loopexit.loopexit, label %for.body43.prol, !llvm.loop !1

for.body43.prol.loopexit.loopexit:                ; preds = %for.body43.prol
  br label %for.body43.prol.loopexit

for.body43.prol.loopexit:                         ; preds = %for.body43.prol.loopexit.loopexit, %for.body43.lr.ph
  %indvars.iv52.unr = phi i64 [ %indvars.iv75, %for.body43.lr.ph ], [ %6, %for.body43.prol.loopexit.loopexit ]
  %16 = icmp ult i64 %8, 7
  br i1 %16, label %for.cond19.loopexit, label %for.body43.preheader

for.body43.preheader:                             ; preds = %for.body43.prol.loopexit
  %17 = sub i64 992, %indvars.iv52.unr
  %18 = lshr i64 %17, 3
  %19 = add nuw nsw i64 %18, 1
  %min.iters.check = icmp ult i64 %19, 2
  br i1 %min.iters.check, label %for.body43.preheader80, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body43.preheader
  %n.mod.vf = and i64 %19, 1
  %n.vec = sub nsw i64 %19, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %20 = add i64 %indvars.iv52.unr, 8
  %21 = shl nuw i64 %18, 3
  %22 = add i64 %20, %21
  %23 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %22, %23
  br i1 %cmp.zero, label %for.body43.preheader80, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %24 = shl i64 %index, 3
  %25 = add i64 %indvars.iv52.unr, %24
  %26 = add nsw i64 %25, 7
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv58, i64 %26
  %28 = getelementptr double, double* %27, i64 -7
  %29 = bitcast double* %28 to <16 x double>*
  store <16 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <16 x double>* %29, align 8
  %index.next = add i64 %index, 2
  %30 = icmp eq i64 %index.next, %n.vec
  br i1 %30, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.cond19.loopexit, label %for.body43.preheader80

for.body43.preheader80:                           ; preds = %middle.block, %min.iters.checked, %for.body43.preheader
  %indvars.iv52.ph = phi i64 [ %indvars.iv52.unr, %min.iters.checked ], [ %indvars.iv52.unr, %for.body43.preheader ], [ %ind.end, %middle.block ]
  br label %for.body43

for.body43:                                       ; preds = %for.body43.preheader80, %for.body43
  %indvars.iv52 = phi i64 [ %indvars.iv.next53.7, %for.body43 ], [ %indvars.iv52.ph, %for.body43.preheader80 ]
  %arrayidx47 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv52
  store double -9.990000e+02, double* %arrayidx47, align 8
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %arrayidx47.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv.next53
  store double -9.990000e+02, double* %arrayidx47.1, align 8
  %indvars.iv.next53.1 = add nsw i64 %indvars.iv52, 2
  %arrayidx47.2 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv.next53.1
  store double -9.990000e+02, double* %arrayidx47.2, align 8
  %indvars.iv.next53.2 = add nsw i64 %indvars.iv52, 3
  %arrayidx47.3 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv.next53.2
  store double -9.990000e+02, double* %arrayidx47.3, align 8
  %indvars.iv.next53.3 = add nsw i64 %indvars.iv52, 4
  %arrayidx47.4 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv.next53.3
  store double -9.990000e+02, double* %arrayidx47.4, align 8
  %indvars.iv.next53.4 = add nsw i64 %indvars.iv52, 5
  %arrayidx47.5 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv.next53.4
  store double -9.990000e+02, double* %arrayidx47.5, align 8
  %indvars.iv.next53.5 = add nsw i64 %indvars.iv52, 6
  %arrayidx47.6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv.next53.5
  store double -9.990000e+02, double* %arrayidx47.6, align 8
  %indvars.iv.next53.6 = add nsw i64 %indvars.iv52, 7
  %arrayidx47.7 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv.next53.6
  store double -9.990000e+02, double* %arrayidx47.7, align 8
  %indvars.iv.next53.7 = add nsw i64 %indvars.iv52, 8
  %exitcond55.7 = icmp eq i64 %indvars.iv.next53.7, 1000
  br i1 %exitcond55.7, label %for.cond19.loopexit.loopexit, label %for.body43, !llvm.loop !6

for.end53:                                        ; preds = %for.cond19.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_symm(i32 %m, i32 %n, double %alpha, double %beta, [1200 x double]* %C, [1000 x double]* %A, [1200 x double]* %B) unnamed_addr #2 {
entry:
  %mul44.us57 = fmul double %alpha, 0.000000e+00
  %broadcast.splatinsert121 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat122 = shufflevector <2 x double> %broadcast.splatinsert121, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert125 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat126 = shufflevector <2 x double> %broadcast.splatinsert125, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert127 = insertelement <2 x double> undef, double %mul44.us57, i32 0
  %broadcast.splat128 = shufflevector <2 x double> %broadcast.splatinsert127, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %entry, %for.cond1.for.inc53_crit_edge.us
  %indvars.iv99 = phi i64 [ %indvars.iv.next100, %for.cond1.for.inc53_crit_edge.us ], [ 0, %entry ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv99, i64 0
  %0 = add i64 %indvars.iv99, 1
  %scevgep109 = getelementptr [1200 x double], [1200 x double]* %C, i64 %0, i64 0
  %cmp532.us = icmp sgt i64 %indvars.iv99, 0
  %arrayidx41.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv99, i64 %indvars.iv99
  br i1 %cmp532.us, label %for.cond4.preheader.us.us.preheader, label %vector.memcheck

for.cond4.preheader.us.us.preheader:              ; preds = %for.cond1.preheader.us
  br label %for.cond4.preheader.us.us

vector.memcheck:                                  ; preds = %for.cond1.preheader.us
  %scevgep113 = getelementptr [1200 x double], [1200 x double]* %B, i64 %0, i64 0
  %scevgep111 = getelementptr [1200 x double], [1200 x double]* %B, i64 %indvars.iv99, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep113
  %bound1 = icmp ult double* %scevgep111, %scevgep109
  %found.conflict = and i1 %bound0, %bound1
  %bound0116 = icmp ult double* %scevgep, %arrayidx41.us.us
  %bound1117 = icmp ult double* %arrayidx41.us.us, %scevgep109
  %found.conflict118 = and i1 %bound0116, %bound1117
  %conflict.rdx = or i1 %found.conflict, %found.conflict118
  br i1 %conflict.rdx, label %for.cond4.preheader.us43.preheader, label %vector.ph

for.cond4.preheader.us43.preheader:               ; preds = %vector.memcheck
  br label %for.cond4.preheader.us43

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv99, i64 %index
  %2 = bitcast double* %1 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %2, align 8, !alias.scope !8, !noalias !11
  %3 = getelementptr double, double* %1, i64 2
  %4 = bitcast double* %3 to <2 x double>*
  %wide.load120 = load <2 x double>, <2 x double>* %4, align 8, !alias.scope !8, !noalias !11
  %5 = fmul <2 x double> %wide.load, %broadcast.splat122
  %6 = fmul <2 x double> %wide.load120, %broadcast.splat122
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv99, i64 %index
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load123 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !14
  %9 = getelementptr double, double* %7, i64 2
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load124 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !14
  %11 = fmul <2 x double> %wide.load123, %broadcast.splat126
  %12 = fmul <2 x double> %wide.load124, %broadcast.splat126
  %13 = load double, double* %arrayidx41.us.us, align 8, !alias.scope !15
  %14 = insertelement <2 x double> undef, double %13, i32 0
  %15 = shufflevector <2 x double> %14, <2 x double> undef, <2 x i32> zeroinitializer
  %16 = insertelement <2 x double> undef, double %13, i32 0
  %17 = shufflevector <2 x double> %16, <2 x double> undef, <2 x i32> zeroinitializer
  %18 = fmul <2 x double> %11, %15
  %19 = fmul <2 x double> %12, %17
  %20 = fadd <2 x double> %5, %18
  %21 = fadd <2 x double> %6, %19
  %22 = fadd <2 x double> %broadcast.splat128, %20
  %23 = fadd <2 x double> %broadcast.splat128, %21
  %24 = bitcast double* %1 to <2 x double>*
  store <2 x double> %22, <2 x double>* %24, align 8, !alias.scope !8, !noalias !11
  %25 = bitcast double* %3 to <2 x double>*
  store <2 x double> %23, <2 x double>* %25, align 8, !alias.scope !8, !noalias !11
  %index.next = add i64 %index, 4
  %26 = icmp eq i64 %index.next, 1200
  br i1 %26, label %for.cond1.for.inc53_crit_edge.us.loopexit132, label %vector.body, !llvm.loop !16

for.cond4.preheader.us43:                         ; preds = %for.cond4.preheader.us43, %for.cond4.preheader.us43.preheader
  %indvars.iv = phi i64 [ 0, %for.cond4.preheader.us43.preheader ], [ %indvars.iv.next.1, %for.cond4.preheader.us43 ]
  %arrayidx31.us50 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv99, i64 %indvars.iv
  %27 = load double, double* %arrayidx31.us50, align 8
  %mul32.us51 = fmul double %27, %beta
  %arrayidx36.us52 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv99, i64 %indvars.iv
  %28 = load double, double* %arrayidx36.us52, align 8
  %mul37.us53 = fmul double %28, %alpha
  %29 = load double, double* %arrayidx41.us.us, align 8
  %mul42.us55 = fmul double %mul37.us53, %29
  %add43.us56 = fadd double %mul32.us51, %mul42.us55
  %add45.us58 = fadd double %mul44.us57, %add43.us56
  store double %add45.us58, double* %arrayidx31.us50, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx31.us50.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv99, i64 %indvars.iv.next
  %30 = load double, double* %arrayidx31.us50.1, align 8
  %mul32.us51.1 = fmul double %30, %beta
  %arrayidx36.us52.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv99, i64 %indvars.iv.next
  %31 = load double, double* %arrayidx36.us52.1, align 8
  %mul37.us53.1 = fmul double %31, %alpha
  %32 = load double, double* %arrayidx41.us.us, align 8
  %mul42.us55.1 = fmul double %mul37.us53.1, %32
  %add43.us56.1 = fadd double %mul32.us51.1, %mul42.us55.1
  %add45.us58.1 = fadd double %mul44.us57, %add43.us56.1
  store double %add45.us58.1, double* %arrayidx31.us50.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %for.cond1.for.inc53_crit_edge.us.loopexit131, label %for.cond4.preheader.us43, !llvm.loop !17

for.cond1.for.inc53_crit_edge.us.loopexit:        ; preds = %for.cond4.for.end_crit_edge.us.us
  br label %for.cond1.for.inc53_crit_edge.us

for.cond1.for.inc53_crit_edge.us.loopexit131:     ; preds = %for.cond4.preheader.us43
  br label %for.cond1.for.inc53_crit_edge.us

for.cond1.for.inc53_crit_edge.us.loopexit132:     ; preds = %vector.body
  br label %for.cond1.for.inc53_crit_edge.us

for.cond1.for.inc53_crit_edge.us:                 ; preds = %for.cond1.for.inc53_crit_edge.us.loopexit132, %for.cond1.for.inc53_crit_edge.us.loopexit131, %for.cond1.for.inc53_crit_edge.us.loopexit
  %indvars.iv.next100 = add nuw nsw i64 %indvars.iv99, 1
  %exitcond105 = icmp eq i64 %indvars.iv.next100, 1000
  br i1 %exitcond105, label %for.end55, label %for.cond1.preheader.us

for.cond4.preheader.us.us:                        ; preds = %for.cond4.preheader.us.us.preheader, %for.cond4.for.end_crit_edge.us.us
  %indvars.iv95 = phi i64 [ %indvars.iv.next96, %for.cond4.for.end_crit_edge.us.us ], [ 0, %for.cond4.preheader.us.us.preheader ]
  %arrayidx8.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv99, i64 %indvars.iv95
  br label %for.body6.us.us

for.cond4.for.end_crit_edge.us.us:                ; preds = %for.body6.us.us
  %arrayidx31.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv99, i64 %indvars.iv95
  %33 = load double, double* %arrayidx31.us.us, align 8
  %mul32.us.us = fmul double %33, %beta
  %34 = load double, double* %arrayidx8.us.us, align 8
  %mul37.us.us = fmul double %34, %alpha
  %35 = load double, double* %arrayidx41.us.us, align 8
  %mul42.us.us = fmul double %mul37.us.us, %35
  %add43.us.us = fadd double %mul32.us.us, %mul42.us.us
  %mul44.us.us = fmul double %add27.us.us, %alpha
  %add45.us.us = fadd double %mul44.us.us, %add43.us.us
  store double %add45.us.us, double* %arrayidx31.us.us, align 8
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  %exitcond104 = icmp eq i64 %indvars.iv.next96, 1200
  br i1 %exitcond104, label %for.cond1.for.inc53_crit_edge.us.loopexit, label %for.cond4.preheader.us.us

for.body6.us.us:                                  ; preds = %for.body6.us.us, %for.cond4.preheader.us.us
  %indvars.iv87 = phi i64 [ %indvars.iv.next88, %for.body6.us.us ], [ 0, %for.cond4.preheader.us.us ]
  %temp2.034.us.us = phi double [ %add27.us.us, %for.body6.us.us ], [ 0.000000e+00, %for.cond4.preheader.us.us ]
  %36 = load double, double* %arrayidx8.us.us, align 8
  %mul.us.us = fmul double %36, %alpha
  %arrayidx12.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv99, i64 %indvars.iv87
  %37 = load double, double* %arrayidx12.us.us, align 8
  %mul13.us.us = fmul double %mul.us.us, %37
  %arrayidx17.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv87, i64 %indvars.iv95
  %38 = load double, double* %arrayidx17.us.us, align 8
  %add.us.us = fadd double %38, %mul13.us.us
  store double %add.us.us, double* %arrayidx17.us.us, align 8
  %arrayidx21.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv87, i64 %indvars.iv95
  %39 = load double, double* %arrayidx21.us.us, align 8
  %40 = load double, double* %arrayidx12.us.us, align 8
  %mul26.us.us = fmul double %39, %40
  %add27.us.us = fadd double %temp2.034.us.us, %mul26.us.us
  %indvars.iv.next88 = add nuw nsw i64 %indvars.iv87, 1
  %exitcond94 = icmp eq i64 %indvars.iv.next88, %indvars.iv99
  br i1 %exitcond94, label %for.cond4.for.end_crit_edge.us.us, label %for.body6.us.us

for.end55:                                        ; preds = %for.cond1.for.inc53_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %m, i32 %n, [1200 x double]* %C) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %indvars.iv15 = phi i64 [ 0, %entry ], [ %indvars.iv.next16, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv15, 1000
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
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv15, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next16, 1000
  br i1 %exitcond20, label %for.end12, label %for.cond2.preheader.us

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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
!8 = !{!9}
!9 = distinct !{!9, !10}
!10 = distinct !{!10, !"LVerDomain"}
!11 = !{!12, !13}
!12 = distinct !{!12, !10}
!13 = distinct !{!13, !10}
!14 = !{!12}
!15 = !{!13}
!16 = distinct !{!16, !4, !5}
!17 = distinct !{!17, !4, !5}
