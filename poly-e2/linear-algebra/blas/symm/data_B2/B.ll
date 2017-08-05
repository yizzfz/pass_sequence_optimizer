; ModuleID = 'A.ll'
source_filename = "symm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
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
  tail call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  tail call fastcc void @kernel_symm(i32 1000, i32 1200, double %0, double %1, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
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
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %m, i32 %n, double* nocapture %alpha, double* nocapture %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture %A, [1200 x double]* nocapture %B) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  %0 = sext i32 %n to i64
  %1 = sext i32 %m to i64
  %2 = zext i32 %n to i64
  %cmp31 = icmp sgt i32 %m, 0
  br i1 %cmp31, label %for.cond1.preheader.lr.ph, label %for.end53

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp229 = icmp sgt i32 %n, 0
  %conv4 = sitofp i32 %m to double
  br i1 %cmp229, label %for.cond1.preheader.us.preheader, label %for.cond23.preheader.lr.ph

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.inc16_crit_edge.us
  %indvars.iv1832.us = phi i64 [ %indvars.iv.next19.us, %for.cond1.for.inc16_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  %3 = add nuw nsw i64 %indvars.iv1832.us, %2
  %4 = trunc i64 %3 to i32
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv1430.us = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next15.us, %for.body3.us ]
  %5 = add nuw nsw i64 %indvars.iv1430.us, %indvars.iv1832.us
  %6 = trunc i64 %5 to i32
  %rem.us = srem i32 %6, 100
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv4
  %arrayidx6.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1832.us, i64 %indvars.iv1430.us
  store double %div.us, double* %arrayidx6.us, align 8
  %7 = sub nsw i64 0, %indvars.iv1430.us
  %8 = trunc i64 %7 to i32
  %sub.us = add i32 %4, %8
  %rem8.us = srem i32 %sub.us, 100
  %conv9.us = sitofp i32 %rem8.us to double
  %div11.us = fdiv double %conv9.us, %conv4
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv1832.us, i64 %indvars.iv1430.us
  store double %div11.us, double* %arrayidx15.us, align 8
  %indvars.iv.next15.us = add nuw nsw i64 %indvars.iv1430.us, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next15.us, %0
  br i1 %exitcond37, label %for.cond1.for.inc16_crit_edge.us, label %for.body3.us

for.cond1.for.inc16_crit_edge.us:                 ; preds = %for.body3.us
  %indvars.iv.next19.us = add nuw nsw i64 %indvars.iv1832.us, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next19.us, %1
  br i1 %exitcond38, label %for.cond19.preheader, label %for.cond1.preheader.us

for.cond19.preheader:                             ; preds = %for.cond1.for.inc16_crit_edge.us
  %cmp2025 = icmp sgt i32 %m, 0
  br i1 %cmp2025, label %for.cond23.preheader.lr.ph, label %for.end53

for.cond23.preheader.lr.ph:                       ; preds = %for.cond1.preheader.lr.ph, %for.cond19.preheader
  %9 = sext i32 %m to i64
  %10 = add i32 %m, -1
  %conv30 = sitofp i32 %m to double
  %wide.trip.count8 = zext i32 %10 to i64
  %11 = add nsw i64 %wide.trip.count8, -1
  %12 = add nsw i64 %wide.trip.count8, -8
  %13 = trunc i32 %10 to i3
  br label %for.cond23.preheader

for.cond23.preheader:                             ; preds = %for.inc51, %for.cond23.preheader.lr.ph
  %indvars.iv47 = phi i3 [ %indvars.iv.next48, %for.inc51 ], [ %13, %for.cond23.preheader.lr.ph ]
  %indvars.iv = phi i64 [ %indvars.iv.next46, %for.inc51 ], [ 0, %for.cond23.preheader.lr.ph ]
  %indvars.iv1028 = phi i64 [ 1, %for.cond23.preheader.lr.ph ], [ %indvars.iv.next11, %for.inc51 ]
  %14 = zext i3 %indvars.iv47 to i64
  %15 = add i64 %indvars.iv, %14
  %16 = sub i64 %wide.trip.count8, %indvars.iv
  %17 = sub i64 %11, %indvars.iv
  %18 = and i64 %indvars.iv, 1
  %lcmp.mod = icmp eq i64 %18, 0
  br i1 %lcmp.mod, label %for.body26.prol, label %for.body26.prol.loopexit

for.body26.prol:                                  ; preds = %for.cond23.preheader
  %19 = trunc i64 %indvars.iv to i32
  %rem28.prol = srem i32 %19, 100
  %conv29.prol = sitofp i32 %rem28.prol to double
  %div31.prol = fdiv double %conv29.prol, %conv30
  %arrayidx35.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv, i64 0
  store double %div31.prol, double* %arrayidx35.prol, align 8
  br label %for.body26.prol.loopexit

for.body26.prol.loopexit:                         ; preds = %for.body26.prol, %for.cond23.preheader
  %indvars.iv21.unr.ph = phi i64 [ 1, %for.body26.prol ], [ 0, %for.cond23.preheader ]
  %20 = icmp eq i64 %indvars.iv, 0
  br i1 %20, label %for.cond40.preheader, label %for.body26.preheader

for.body26.preheader:                             ; preds = %for.body26.prol.loopexit
  br label %for.body26

for.cond40.preheader.loopexit:                    ; preds = %for.body26
  br label %for.cond40.preheader

for.cond40.preheader:                             ; preds = %for.cond40.preheader.loopexit, %for.body26.prol.loopexit
  %exitcond923 = icmp eq i64 %wide.trip.count8, %indvars.iv
  br i1 %exitcond923, label %for.inc51, label %for.body43.preheader

for.body43.preheader:                             ; preds = %for.cond40.preheader
  %xtraiter35 = and i64 %16, 7
  %lcmp.mod36 = icmp eq i64 %xtraiter35, 0
  br i1 %lcmp.mod36, label %for.body43.prol.loopexit, label %for.body43.prol.preheader

for.body43.prol.preheader:                        ; preds = %for.body43.preheader
  br label %for.body43.prol

for.body43.prol:                                  ; preds = %for.body43.prol.preheader, %for.body43.prol
  %indvars.iv.next724.in.prol = phi i64 [ %indvars.iv.next724.prol, %for.body43.prol ], [ %indvars.iv, %for.body43.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body43.prol ], [ %xtraiter35, %for.body43.prol.preheader ]
  %indvars.iv.next724.prol = add nuw nsw i64 %indvars.iv.next724.in.prol, 1
  %arrayidx47.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv.next724.prol
  store double -9.990000e+02, double* %arrayidx47.prol, align 8
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body43.prol.loopexit.loopexit, label %for.body43.prol, !llvm.loop !1

for.body43.prol.loopexit.loopexit:                ; preds = %for.body43.prol
  br label %for.body43.prol.loopexit

for.body43.prol.loopexit:                         ; preds = %for.body43.prol.loopexit.loopexit, %for.body43.preheader
  %indvars.iv.next724.in.unr = phi i64 [ %indvars.iv, %for.body43.preheader ], [ %15, %for.body43.prol.loopexit.loopexit ]
  %21 = icmp ult i64 %17, 7
  br i1 %21, label %for.inc51, label %for.body43.preheader44

for.body43.preheader44:                           ; preds = %for.body43.prol.loopexit
  %22 = sub i64 %12, %indvars.iv.next724.in.unr
  %23 = lshr i64 %22, 3
  %24 = add nuw nsw i64 %23, 1
  %min.iters.check = icmp ult i64 %24, 2
  br i1 %min.iters.check, label %for.body43.preheader45, label %min.iters.checked

for.body43.preheader45:                           ; preds = %middle.block, %min.iters.checked, %for.body43.preheader44
  %indvars.iv.next724.in.ph = phi i64 [ %indvars.iv.next724.in.unr, %min.iters.checked ], [ %indvars.iv.next724.in.unr, %for.body43.preheader44 ], [ %ind.end, %middle.block ]
  br label %for.body43

min.iters.checked:                                ; preds = %for.body43.preheader44
  %n.mod.vf = and i64 %24, 1
  %n.vec = sub nsw i64 %24, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %25 = add i64 %indvars.iv.next724.in.unr, 8
  %26 = shl nuw i64 %23, 3
  %27 = add i64 %25, %26
  %28 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %27, %28
  br i1 %cmp.zero, label %for.body43.preheader45, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %29 = shl i64 %index, 3
  %30 = add i64 %indvars.iv.next724.in.unr, %29
  %31 = add nsw i64 %30, 8
  %32 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv, i64 %31
  %33 = getelementptr double, double* %32, i64 -7
  %34 = bitcast double* %33 to <16 x double>*
  store <16 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <16 x double>* %34, align 8
  %index.next = add i64 %index, 2
  %35 = icmp eq i64 %index.next, %n.vec
  br i1 %35, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.inc51, label %for.body43.preheader45

for.body26:                                       ; preds = %for.body26.preheader, %for.body26
  %indvars.iv21 = phi i64 [ %indvars.iv.next.1, %for.body26 ], [ %indvars.iv21.unr.ph, %for.body26.preheader ]
  %36 = add nuw nsw i64 %indvars.iv21, %indvars.iv
  %37 = trunc i64 %36 to i32
  %rem28 = srem i32 %37, 100
  %conv29 = sitofp i32 %rem28 to double
  %div31 = fdiv double %conv29, %conv30
  %arrayidx35 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv21
  store double %div31, double* %arrayidx35, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv21, 1
  %38 = add nuw nsw i64 %indvars.iv.next, %indvars.iv
  %39 = trunc i64 %38 to i32
  %rem28.1 = srem i32 %39, 100
  %conv29.1 = sitofp i32 %rem28.1 to double
  %div31.1 = fdiv double %conv29.1, %conv30
  %arrayidx35.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv.next
  store double %div31.1, double* %arrayidx35.1, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv21, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv1028
  br i1 %exitcond.1, label %for.cond40.preheader.loopexit, label %for.body26

for.body43:                                       ; preds = %for.body43.preheader45, %for.body43
  %indvars.iv.next724.in = phi i64 [ %indvars.iv.next724.7, %for.body43 ], [ %indvars.iv.next724.in.ph, %for.body43.preheader45 ]
  %indvars.iv.next724 = add nuw nsw i64 %indvars.iv.next724.in, 1
  %arrayidx47 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv.next724
  store double -9.990000e+02, double* %arrayidx47, align 8
  %indvars.iv.next724.1 = add nsw i64 %indvars.iv.next724.in, 2
  %arrayidx47.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv.next724.1
  store double -9.990000e+02, double* %arrayidx47.1, align 8
  %indvars.iv.next724.2 = add nsw i64 %indvars.iv.next724.in, 3
  %arrayidx47.2 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv.next724.2
  store double -9.990000e+02, double* %arrayidx47.2, align 8
  %indvars.iv.next724.3 = add nsw i64 %indvars.iv.next724.in, 4
  %arrayidx47.3 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv.next724.3
  store double -9.990000e+02, double* %arrayidx47.3, align 8
  %indvars.iv.next724.4 = add nsw i64 %indvars.iv.next724.in, 5
  %arrayidx47.4 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv.next724.4
  store double -9.990000e+02, double* %arrayidx47.4, align 8
  %indvars.iv.next724.5 = add nsw i64 %indvars.iv.next724.in, 6
  %arrayidx47.5 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv.next724.5
  store double -9.990000e+02, double* %arrayidx47.5, align 8
  %indvars.iv.next724.6 = add nsw i64 %indvars.iv.next724.in, 7
  %arrayidx47.6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv.next724.6
  store double -9.990000e+02, double* %arrayidx47.6, align 8
  %indvars.iv.next724.7 = add nsw i64 %indvars.iv.next724.in, 8
  %arrayidx47.7 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv.next724.7
  store double -9.990000e+02, double* %arrayidx47.7, align 8
  %exitcond9.7 = icmp eq i64 %indvars.iv.next724.7, %wide.trip.count8
  br i1 %exitcond9.7, label %for.inc51.loopexit, label %for.body43, !llvm.loop !6

for.inc51.loopexit:                               ; preds = %for.body43
  br label %for.inc51

for.inc51:                                        ; preds = %for.inc51.loopexit, %middle.block, %for.body43.prol.loopexit, %for.cond40.preheader
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv, 1
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv1028, 1
  %exitcond = icmp eq i64 %indvars.iv.next46, %9
  %indvars.iv.next48 = add i3 %indvars.iv47, -1
  br i1 %exitcond, label %for.end53.loopexit, label %for.cond23.preheader

for.end53.loopexit:                               ; preds = %for.inc51
  br label %for.end53

for.end53:                                        ; preds = %for.end53.loopexit, %entry, %for.cond19.preheader
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_symm(i32 %m, i32 %n, double %alpha, double %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture readonly %A, [1200 x double]* nocapture readonly %B) unnamed_addr #2 {
entry:
  %0 = sext i32 %n to i64
  %1 = sext i32 %m to i64
  %cmp14 = icmp sgt i32 %m, 0
  %cmp212 = icmp sgt i32 %n, 0
  %or.cond = and i1 %cmp14, %cmp212
  br i1 %or.cond, label %for.cond1.preheader.us.preheader, label %for.end55

for.cond1.preheader.us.preheader:                 ; preds = %entry
  %xtraiter = and i64 %0, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %2 = icmp eq i32 %n, 1
  %mul44.us28 = fmul double %alpha, 0.000000e+00
  %mul44.us28.1 = fmul double %alpha, 0.000000e+00
  %mul44.us28.prol = fmul double %alpha, 0.000000e+00
  %3 = add nsw i64 %0, -2
  %4 = add nsw i64 %0, -2
  %broadcast.splatinsert76 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat77 = shufflevector <2 x double> %broadcast.splatinsert76, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert81 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat82 = shufflevector <2 x double> %broadcast.splatinsert81, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert83 = insertelement <2 x double> undef, double %mul44.us28, i32 0
  %broadcast.splat84 = shufflevector <2 x double> %broadcast.splatinsert83, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert85 = insertelement <2 x double> undef, double %mul44.us28.1, i32 0
  %broadcast.splat86 = shufflevector <2 x double> %broadcast.splatinsert85, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.inc53_crit_edge.us
  %indvars.iv715.us = phi i64 [ %indvars.iv.next8.us, %for.cond1.for.inc53_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  %scevgep62 = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv715.us, i64 2
  %scevgep68 = getelementptr [1200 x double], [1200 x double]* %B, i64 %indvars.iv715.us, i64 2
  %exitcond9.us = icmp eq i64 %indvars.iv715.us, 0
  %arrayidx41.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv715.us, i64 %indvars.iv715.us
  br i1 %exitcond9.us, label %for.cond4.preheader.us18.preheader, label %for.cond4.preheader.us.us.preheader

for.cond4.preheader.us.us.preheader:              ; preds = %for.cond1.preheader.us
  br label %for.cond4.preheader.us.us

for.cond4.preheader.us18.preheader:               ; preds = %for.cond1.preheader.us
  br i1 %lcmp.mod, label %for.cond4.preheader.us18.prol.loopexit, label %for.cond4.preheader.us18.prol

for.cond4.preheader.us18.prol:                    ; preds = %for.cond4.preheader.us18.preheader
  %arrayidx31.us22.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv715.us, i64 0
  %5 = load double, double* %arrayidx31.us22.prol, align 8
  %mul32.us23.prol = fmul double %5, %beta
  %arrayidx36.us24.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv715.us, i64 0
  %6 = load double, double* %arrayidx36.us24.prol, align 8
  %mul37.us25.prol = fmul double %6, %alpha
  %7 = load double, double* %arrayidx41.us, align 8
  %mul42.us26.prol = fmul double %mul37.us25.prol, %7
  %add43.us27.prol = fadd double %mul32.us23.prol, %mul42.us26.prol
  %add45.us29.prol = fadd double %mul44.us28.prol, %add43.us27.prol
  store double %add45.us29.prol, double* %arrayidx31.us22.prol, align 8
  br label %for.cond4.preheader.us18.prol.loopexit

for.cond4.preheader.us18.prol.loopexit:           ; preds = %for.cond4.preheader.us18.prol, %for.cond4.preheader.us18.preheader
  %indvars.iv513.us19.unr.ph = phi i64 [ 1, %for.cond4.preheader.us18.prol ], [ 0, %for.cond4.preheader.us18.preheader ]
  br i1 %2, label %for.cond1.for.inc53_crit_edge.us, label %for.cond4.preheader.us18.preheader58

for.cond4.preheader.us18.preheader58:             ; preds = %for.cond4.preheader.us18.prol.loopexit
  %8 = sub nsw i64 %3, %indvars.iv513.us19.unr.ph
  %9 = lshr i64 %8, 1
  %10 = add nuw i64 %9, 1
  %min.iters.check = icmp ult i64 %10, 2
  br i1 %min.iters.check, label %for.cond4.preheader.us18.preheader87, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond4.preheader.us18.preheader58
  %n.mod.vf = and i64 %10, 1
  %n.vec = sub i64 %10, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %for.cond4.preheader.us18.preheader87, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep60 = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv715.us, i64 %indvars.iv513.us19.unr.ph
  %11 = sub nsw i64 %4, %indvars.iv513.us19.unr.ph
  %12 = and i64 %11, -2
  %13 = or i64 %indvars.iv513.us19.unr.ph, %12
  %scevgep63 = getelementptr double, double* %scevgep62, i64 %13
  %scevgep66 = getelementptr [1200 x double], [1200 x double]* %B, i64 %indvars.iv715.us, i64 %indvars.iv513.us19.unr.ph
  %scevgep69 = getelementptr double, double* %scevgep68, i64 %13
  %bound0 = icmp ult double* %scevgep60, %scevgep69
  %bound1 = icmp ult double* %scevgep66, %scevgep63
  %found.conflict = and i1 %bound0, %bound1
  %bound072 = icmp ult double* %scevgep60, %arrayidx41.us
  %bound173 = icmp ult double* %arrayidx41.us, %scevgep63
  %found.conflict74 = and i1 %bound072, %bound173
  %conflict.rdx = or i1 %found.conflict, %found.conflict74
  %14 = or i64 %indvars.iv513.us19.unr.ph, 2
  %15 = shl nuw i64 %9, 1
  %16 = add i64 %14, %15
  %17 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %16, %17
  br i1 %conflict.rdx, label %for.cond4.preheader.us18.preheader87, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %18 = load double, double* %arrayidx41.us, align 8, !alias.scope !8
  %19 = insertelement <2 x double> undef, double %18, i32 0
  %20 = shufflevector <2 x double> %19, <2 x double> undef, <2 x i32> zeroinitializer
  %21 = load double, double* %arrayidx41.us, align 8, !alias.scope !8
  %22 = insertelement <2 x double> undef, double %21, i32 0
  %23 = shufflevector <2 x double> %22, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %24 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv513.us19.unr.ph, %24
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv715.us, i64 %offset.idx
  %26 = bitcast double* %25 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %26, align 8, !alias.scope !11, !noalias !13
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec75 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %27 = fmul <2 x double> %strided.vec, %broadcast.splat77
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv715.us, i64 %offset.idx
  %29 = bitcast double* %28 to <4 x double>*
  %wide.vec78 = load <4 x double>, <4 x double>* %29, align 8, !alias.scope !15
  %strided.vec79 = shufflevector <4 x double> %wide.vec78, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec80 = shufflevector <4 x double> %wide.vec78, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %30 = fmul <2 x double> %strided.vec79, %broadcast.splat82
  %31 = fmul <2 x double> %30, %20
  %32 = fadd <2 x double> %27, %31
  %33 = fadd <2 x double> %broadcast.splat84, %32
  %34 = add nuw nsw i64 %offset.idx, 1
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv715.us, i64 %34
  %36 = fmul <2 x double> %strided.vec75, %broadcast.splat77
  %37 = fmul <2 x double> %strided.vec80, %broadcast.splat82
  %38 = fmul <2 x double> %37, %23
  %39 = fadd <2 x double> %36, %38
  %40 = fadd <2 x double> %broadcast.splat86, %39
  %41 = getelementptr double, double* %35, i64 -1
  %42 = bitcast double* %41 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %33, <2 x double> %40, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %42, align 8, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 2
  %43 = icmp eq i64 %index.next, %n.vec
  br i1 %43, label %middle.block, label %vector.body, !llvm.loop !16

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.cond1.for.inc53_crit_edge.us, label %for.cond4.preheader.us18.preheader87

for.cond4.preheader.us18.preheader87:             ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond4.preheader.us18.preheader58
  %indvars.iv513.us19.ph = phi i64 [ %indvars.iv513.us19.unr.ph, %vector.memcheck ], [ %indvars.iv513.us19.unr.ph, %min.iters.checked ], [ %indvars.iv513.us19.unr.ph, %for.cond4.preheader.us18.preheader58 ], [ %ind.end, %middle.block ]
  br label %for.cond4.preheader.us18

for.cond4.preheader.us18:                         ; preds = %for.cond4.preheader.us18.preheader87, %for.cond4.preheader.us18
  %indvars.iv513.us19 = phi i64 [ %indvars.iv.next6.us30.1, %for.cond4.preheader.us18 ], [ %indvars.iv513.us19.ph, %for.cond4.preheader.us18.preheader87 ]
  %arrayidx31.us22 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv715.us, i64 %indvars.iv513.us19
  %44 = load double, double* %arrayidx31.us22, align 8
  %mul32.us23 = fmul double %44, %beta
  %arrayidx36.us24 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv715.us, i64 %indvars.iv513.us19
  %45 = load double, double* %arrayidx36.us24, align 8
  %mul37.us25 = fmul double %45, %alpha
  %46 = load double, double* %arrayidx41.us, align 8
  %mul42.us26 = fmul double %mul37.us25, %46
  %add43.us27 = fadd double %mul32.us23, %mul42.us26
  %add45.us29 = fadd double %mul44.us28, %add43.us27
  store double %add45.us29, double* %arrayidx31.us22, align 8
  %indvars.iv.next6.us30 = add nuw nsw i64 %indvars.iv513.us19, 1
  %arrayidx31.us22.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv715.us, i64 %indvars.iv.next6.us30
  %47 = load double, double* %arrayidx31.us22.1, align 8
  %mul32.us23.1 = fmul double %47, %beta
  %arrayidx36.us24.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv715.us, i64 %indvars.iv.next6.us30
  %48 = load double, double* %arrayidx36.us24.1, align 8
  %mul37.us25.1 = fmul double %48, %alpha
  %49 = load double, double* %arrayidx41.us, align 8
  %mul42.us26.1 = fmul double %mul37.us25.1, %49
  %add43.us27.1 = fadd double %mul32.us23.1, %mul42.us26.1
  %add45.us29.1 = fadd double %mul44.us28.1, %add43.us27.1
  store double %add45.us29.1, double* %arrayidx31.us22.1, align 8
  %indvars.iv.next6.us30.1 = add nsw i64 %indvars.iv513.us19, 2
  %exitcond53.1 = icmp eq i64 %indvars.iv.next6.us30.1, %0
  br i1 %exitcond53.1, label %for.cond1.for.inc53_crit_edge.us.loopexit, label %for.cond4.preheader.us18, !llvm.loop !17

for.cond1.for.inc53_crit_edge.us.loopexit:        ; preds = %for.cond4.preheader.us18
  br label %for.cond1.for.inc53_crit_edge.us

for.cond1.for.inc53_crit_edge.us.loopexit88:      ; preds = %for.cond4.for.end_crit_edge.us.us
  br label %for.cond1.for.inc53_crit_edge.us

for.cond1.for.inc53_crit_edge.us:                 ; preds = %for.cond1.for.inc53_crit_edge.us.loopexit88, %for.cond1.for.inc53_crit_edge.us.loopexit, %middle.block, %for.cond4.preheader.us18.prol.loopexit
  %indvars.iv.next8.us = add nuw nsw i64 %indvars.iv715.us, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next8.us, %1
  br i1 %exitcond54, label %for.end55.loopexit, label %for.cond1.preheader.us

for.cond4.preheader.us.us:                        ; preds = %for.cond4.preheader.us.us.preheader, %for.cond4.for.end_crit_edge.us.us
  %indvars.iv513.us.us = phi i64 [ %indvars.iv.next6.us.us, %for.cond4.for.end_crit_edge.us.us ], [ 0, %for.cond4.preheader.us.us.preheader ]
  %arrayidx8.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv715.us, i64 %indvars.iv513.us.us
  br label %for.body6.us.us

for.cond4.for.end_crit_edge.us.us:                ; preds = %for.body6.us.us
  %arrayidx31.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv715.us, i64 %indvars.iv513.us.us
  %50 = load double, double* %arrayidx31.us.us, align 8
  %mul32.us.us = fmul double %50, %beta
  %arrayidx36.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv715.us, i64 %indvars.iv513.us.us
  %51 = load double, double* %arrayidx36.us.us, align 8
  %mul37.us.us = fmul double %51, %alpha
  %52 = load double, double* %arrayidx41.us, align 8
  %mul42.us.us = fmul double %mul37.us.us, %52
  %add43.us.us = fadd double %mul32.us.us, %mul42.us.us
  %mul44.us.us = fmul double %add27.us.us, %alpha
  %add45.us.us = fadd double %mul44.us.us, %add43.us.us
  store double %add45.us.us, double* %arrayidx31.us.us, align 8
  %indvars.iv.next6.us.us = add nuw nsw i64 %indvars.iv513.us.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next6.us.us, %0
  br i1 %exitcond, label %for.cond1.for.inc53_crit_edge.us.loopexit88, label %for.cond4.preheader.us.us

for.body6.us.us:                                  ; preds = %for.body6.us.us, %for.cond4.preheader.us.us
  %temp2.011.us.us = phi double [ 0.000000e+00, %for.cond4.preheader.us.us ], [ %add27.us.us, %for.body6.us.us ]
  %indvars.iv10.us.us = phi i64 [ 0, %for.cond4.preheader.us.us ], [ %indvars.iv.next.us.us, %for.body6.us.us ]
  %53 = load double, double* %arrayidx8.us.us, align 8
  %mul.us.us = fmul double %53, %alpha
  %arrayidx12.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv715.us, i64 %indvars.iv10.us.us
  %54 = load double, double* %arrayidx12.us.us, align 8
  %mul13.us.us = fmul double %mul.us.us, %54
  %arrayidx17.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv10.us.us, i64 %indvars.iv513.us.us
  %55 = load double, double* %arrayidx17.us.us, align 8
  %add.us.us = fadd double %55, %mul13.us.us
  store double %add.us.us, double* %arrayidx17.us.us, align 8
  %arrayidx21.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv10.us.us, i64 %indvars.iv513.us.us
  %56 = load double, double* %arrayidx21.us.us, align 8
  %57 = load double, double* %arrayidx12.us.us, align 8
  %mul26.us.us = fmul double %56, %57
  %add27.us.us = fadd double %temp2.011.us.us, %mul26.us.us
  %indvars.iv.next.us.us = add nuw nsw i64 %indvars.iv10.us.us, 1
  %exitcond.us.us = icmp eq i64 %indvars.iv.next.us.us, %indvars.iv715.us
  br i1 %exitcond.us.us, label %for.cond4.for.end_crit_edge.us.us, label %for.body6.us.us

for.end55.loopexit:                               ; preds = %for.cond1.for.inc53_crit_edge.us
  br label %for.end55

for.end55:                                        ; preds = %for.end55.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %m, i32 %n, [1200 x double]* nocapture readonly %C) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %3 = sext i32 %n to i64
  %4 = sext i32 %m to i64
  %cmp7 = icmp sgt i32 %m, 0
  %cmp35 = icmp sgt i32 %n, 0
  %or.cond = and i1 %cmp7, %cmp35
  br i1 %or.cond, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.preheader.us.preheader, %for.cond2.for.inc10_crit_edge.us
  %indvars.iv28.us = phi i64 [ %indvars.iv.next3.us, %for.cond2.for.inc10_crit_edge.us ], [ 0, %for.cond2.preheader.us.preheader ]
  %5 = mul nsw i64 %indvars.iv28.us, %4
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv6.us = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next.us, %if.end.us ]
  %6 = add nsw i64 %indvars.iv6.us, %5
  %7 = trunc i64 %6 to i32
  %rem.us = srem i32 %7, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %8) #5
  br label %if.end.us

if.end.us:                                        ; preds = %if.then.us, %for.body4.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv28.us, i64 %indvars.iv6.us
  %10 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %10) #5
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv6.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us, %3
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next3.us = add nuw nsw i64 %indvars.iv28.us, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next3.us, %4
  br i1 %exitcond11, label %for.end12.loopexit, label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %12) #5
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

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }

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
!11 = !{!12}
!12 = distinct !{!12, !10}
!13 = !{!14, !9}
!14 = distinct !{!14, !10}
!15 = !{!14}
!16 = distinct !{!16, !4, !5}
!17 = distinct !{!17, !4, !5}
