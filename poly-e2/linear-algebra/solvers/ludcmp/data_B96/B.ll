; ModuleID = 'A.ll'
source_filename = "ludcmp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %arraydecay = bitcast i8* %call to [2000 x double]*
  %arraydecay4 = bitcast i8* %call1 to double*
  %arraydecay5 = bitcast i8* %call2 to double*
  %arraydecay6 = bitcast i8* %call3 to double*
  tail call fastcc void @init_array([2000 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay5, double* %arraydecay6)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_ludcmp([2000 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay5, double* %arraydecay6)
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
  %1 = bitcast i8* %call2 to double*
  tail call fastcc void @print_array(double* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture %A, double* nocapture %b, double* nocapture %x, double* nocapture %y) unnamed_addr #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv3551 = phi i64 [ 0, %entry ], [ %indvars.iv.next36.1, %for.body ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv3551
  %0 = bitcast double* %arrayidx to <2 x double>*
  %arrayidx3 = getelementptr inbounds double, double* %y, i64 %indvars.iv3551
  %1 = bitcast double* %arrayidx3 to <2 x double>*
  %indvars.iv.next36 = or i64 %indvars.iv3551, 1
  %2 = trunc i64 %indvars.iv.next36 to i32
  %conv4 = sitofp i32 %2 to double
  %arrayidx8 = getelementptr inbounds double, double* %b, i64 %indvars.iv3551
  store <2 x double> zeroinitializer, <2 x double>* %0, align 8
  store <2 x double> zeroinitializer, <2 x double>* %1, align 8
  %indvars.iv.next36.1 = add nuw nsw i64 %indvars.iv3551, 2
  %3 = trunc i64 %indvars.iv.next36.1 to i32
  %conv4.1 = sitofp i32 %3 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv4, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv4.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 2.000000e+03, double 2.000000e+03>
  %div5 = fmul <2 x double> %div, <double 5.000000e-01, double 5.000000e-01>
  %add6 = fadd <2 x double> %div5, <double 4.000000e+00, double 4.000000e+00>
  %4 = bitcast double* %arrayidx8 to <2 x double>*
  store <2 x double> %add6, <2 x double>* %4, align 8
  %exitcond37.1 = icmp eq i64 %indvars.iv.next36.1, 2000
  br i1 %exitcond37.1, label %for.cond13.preheader.preheader, label %for.body

for.cond13.preheader.preheader:                   ; preds = %for.body
  br label %for.cond13.preheader

for.cond13.preheader:                             ; preds = %for.cond13.preheader.preheader, %for.end39.for.cond13.preheader_crit_edge
  %indvars.iv3050 = phi i64 [ %indvars.iv.next31, %for.end39.for.cond13.preheader_crit_edge ], [ 1, %for.cond13.preheader.preheader ]
  %indvars.iv3249 = phi i64 [ %indvars.iv.next33, %for.end39.for.cond13.preheader_crit_edge ], [ 0, %for.cond13.preheader.preheader ]
  %5 = mul nuw nsw i64 %indvars.iv3249, 2001
  %6 = add nuw nsw i64 %5, 1
  %7 = mul nsw i64 %indvars.iv3249, -8
  br label %for.body16

for.cond29.preheader:                             ; preds = %for.body16
  %scevgep = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %6
  %8 = add nsw i64 %7, 15992
  %exitcond2947 = icmp eq i64 %indvars.iv3249, 1999
  br i1 %exitcond2947, label %for.end39.thread, label %for.end39

for.end39.thread:                                 ; preds = %for.cond29.preheader
  %arrayidx4356 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 1999, i64 1999
  store double 1.000000e+00, double* %arrayidx4356, align 8
  br label %for.end46

for.body16:                                       ; preds = %for.body16, %for.cond13.preheader
  %indvars.iv1945 = phi i64 [ 0, %for.cond13.preheader ], [ %indvars.iv.next20, %for.body16 ]
  %9 = sub nsw i64 0, %indvars.iv1945
  %10 = trunc i64 %9 to i32
  %rem = srem i32 %10, 2000
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, 2.000000e+03
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv3249, i64 %indvars.iv1945
  store double %add20, double* %arrayidx24, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv1945, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next20, %indvars.iv3050
  br i1 %exitcond24, label %for.cond29.preheader, label %for.body16

for.end39:                                        ; preds = %for.cond29.preheader
  %11 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %11, i8 0, i64 %8, i32 8, i1 false)
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv3249, i64 %indvars.iv3249
  store double 1.000000e+00, double* %arrayidx43, align 8
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv3249, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next33, 2000
  br i1 %exitcond34, label %for.end46.loopexit, label %for.end39.for.cond13.preheader_crit_edge

for.end39.for.cond13.preheader_crit_edge:         ; preds = %for.end39
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv3050, 1
  br label %for.cond13.preheader

for.end46.loopexit:                               ; preds = %for.end39
  br label %for.end46

for.end46:                                        ; preds = %for.end46.loopexit, %for.end39.thread
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  call void @llvm.memset.p0i8.i64(i8* %call, i8 0, i64 32000000, i32 8, i1 false)
  %12 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond69.preheader

for.cond69.preheader:                             ; preds = %for.end95, %for.end46
  %indvars.iv1042 = phi i64 [ 0, %for.end46 ], [ %indvars.iv.next11, %for.end95 ]
  br label %for.cond73.preheader

for.cond73.preheader:                             ; preds = %for.end92, %for.cond69.preheader
  %indvars.iv741 = phi i64 [ 0, %for.cond69.preheader ], [ %indvars.iv.next8, %for.end92 ]
  %arrayidx80 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv741, i64 %indvars.iv1042
  br label %for.body76

for.body76:                                       ; preds = %for.body76, %for.cond73.preheader
  %indvars.iv440 = phi i64 [ 0, %for.cond73.preheader ], [ %indvars.iv.next5.1, %for.body76 ]
  %13 = load double, double* %arrayidx80, align 8
  %arrayidx84 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv440, i64 %indvars.iv1042
  %14 = load double, double* %arrayidx84, align 8
  %mul = fmul double %13, %14
  %arrayidx88 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %12, i64 0, i64 %indvars.iv741, i64 %indvars.iv440
  %15 = load double, double* %arrayidx88, align 8
  %add89 = fadd double %15, %mul
  store double %add89, double* %arrayidx88, align 8
  %indvars.iv.next5 = or i64 %indvars.iv440, 1
  %16 = load double, double* %arrayidx80, align 8
  %arrayidx84.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next5, i64 %indvars.iv1042
  %17 = load double, double* %arrayidx84.1, align 8
  %mul.1 = fmul double %16, %17
  %arrayidx88.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %12, i64 0, i64 %indvars.iv741, i64 %indvars.iv.next5
  %18 = load double, double* %arrayidx88.1, align 8
  %add89.1 = fadd double %18, %mul.1
  store double %add89.1, double* %arrayidx88.1, align 8
  %indvars.iv.next5.1 = add nuw nsw i64 %indvars.iv440, 2
  %exitcond6.1 = icmp eq i64 %indvars.iv.next5.1, 2000
  br i1 %exitcond6.1, label %for.end92, label %for.body76

for.end92:                                        ; preds = %for.body76
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv741, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 2000
  br i1 %exitcond9, label %for.end95, label %for.cond73.preheader

for.end95:                                        ; preds = %for.end92
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv1042, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 2000
  br i1 %exitcond12, label %for.cond103.preheader.preheader, label %for.cond69.preheader

for.cond103.preheader.preheader:                  ; preds = %for.end95
  %19 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond103.preheader

for.cond103.preheader:                            ; preds = %for.end117, %for.cond103.preheader.preheader
  %indvars.iv139 = phi i64 [ 0, %for.cond103.preheader.preheader ], [ %indvars.iv.next2, %for.end117 ]
  br label %for.body106

for.body106:                                      ; preds = %for.body106, %for.cond103.preheader
  %indvars.iv38 = phi i64 [ 0, %for.cond103.preheader ], [ %indvars.iv.next.4, %for.body106 ]
  %arrayidx110 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv139, i64 %indvars.iv38
  %20 = bitcast double* %arrayidx110 to i64*
  %21 = load i64, i64* %20, align 8
  %arrayidx114 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv139, i64 %indvars.iv38
  %22 = bitcast double* %arrayidx114 to i64*
  store i64 %21, i64* %22, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv38, 1
  %arrayidx110.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv139, i64 %indvars.iv.next
  %23 = bitcast double* %arrayidx110.1 to i64*
  %24 = load i64, i64* %23, align 8
  %arrayidx114.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv139, i64 %indvars.iv.next
  %25 = bitcast double* %arrayidx114.1 to i64*
  store i64 %24, i64* %25, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv38, 2
  %arrayidx110.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv139, i64 %indvars.iv.next.1
  %26 = bitcast double* %arrayidx110.2 to i64*
  %27 = load i64, i64* %26, align 8
  %arrayidx114.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv139, i64 %indvars.iv.next.1
  %28 = bitcast double* %arrayidx114.2 to i64*
  store i64 %27, i64* %28, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv38, 3
  %arrayidx110.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv139, i64 %indvars.iv.next.2
  %29 = bitcast double* %arrayidx110.3 to i64*
  %30 = load i64, i64* %29, align 8
  %arrayidx114.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv139, i64 %indvars.iv.next.2
  %31 = bitcast double* %arrayidx114.3 to i64*
  store i64 %30, i64* %31, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv38, 4
  %arrayidx110.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv139, i64 %indvars.iv.next.3
  %32 = bitcast double* %arrayidx110.4 to i64*
  %33 = load i64, i64* %32, align 8
  %arrayidx114.4 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv139, i64 %indvars.iv.next.3
  %34 = bitcast double* %arrayidx114.4 to i64*
  store i64 %33, i64* %34, align 8
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv38, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %for.end117, label %for.body106

for.end117:                                       ; preds = %for.body106
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv139, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond3, label %for.end120, label %for.cond103.preheader

for.end120:                                       ; preds = %for.end117
  tail call void @free(i8* nonnull %call) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture %A, double* nocapture readonly %b, double* nocapture %x, double* nocapture %y) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.backedge, %entry
  %indvars.iv3760 = phi i64 [ 0, %entry ], [ %indvars.iv3760.be, %for.cond1.preheader.backedge ]
  %exitcond2652 = icmp eq i64 %indvars.iv3760, 0
  br i1 %exitcond2652, label %for.cond1.preheader.backedge, label %for.body3.preheader

for.cond1.preheader.backedge:                     ; preds = %for.cond1.preheader, %for.end57
  %indvars.iv3760.be = phi i64 [ 1, %for.cond1.preheader ], [ %indvars.iv.next38, %for.end57 ]
  br label %for.cond1.preheader

for.body3.preheader:                              ; preds = %for.cond1.preheader
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv3760, i64 0
  br label %for.body3

for.body30.us.preheader:                          ; preds = %for.end
  %xtraiter72 = and i64 %indvars.iv3760, 1
  %0 = icmp eq i64 %xtraiter72, 0
  %1 = icmp eq i64 %indvars.iv3760, 1
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.cond35.for.end50_crit_edge.us, %for.body30.us.preheader
  %indvars.iv3458.us = phi i64 [ %indvars.iv3760, %for.body30.us.preheader ], [ %indvars.iv.next35.us, %for.cond35.for.end50_crit_edge.us ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv3760, i64 %indvars.iv3458.us
  %2 = load double, double* %arrayidx34.us, align 8
  br i1 %0, label %for.body37.us.prol.loopexit, label %for.body37.us.prol

for.body37.us.prol:                               ; preds = %for.body30.us
  %3 = load double, double* %arrayidx12.prol, align 8
  %arrayidx45.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv3458.us
  %4 = load double, double* %arrayidx45.us.prol, align 8
  %mul46.us.prol = fmul double %3, %4
  %sub47.us.prol = fsub double %2, %mul46.us.prol
  br label %for.body37.us.prol.loopexit

for.body37.us.prol.loopexit:                      ; preds = %for.body30.us, %for.body37.us.prol
  %sub47.us.lcssa.unr.ph = phi double [ %sub47.us.prol, %for.body37.us.prol ], [ undef, %for.body30.us ]
  %.unr74.ph = phi double [ %sub47.us.prol, %for.body37.us.prol ], [ %2, %for.body30.us ]
  %indvars.iv2755.us.unr.ph = phi i64 [ 1, %for.body37.us.prol ], [ 0, %for.body30.us ]
  br i1 %1, label %for.cond35.for.end50_crit_edge.us, label %for.body37.us.preheader

for.body37.us.preheader:                          ; preds = %for.body37.us.prol.loopexit
  br label %for.body37.us

for.body37.us:                                    ; preds = %for.body37.us, %for.body37.us.preheader
  %5 = phi double [ %.unr74.ph, %for.body37.us.preheader ], [ %sub47.us.1, %for.body37.us ]
  %indvars.iv2755.us = phi i64 [ %indvars.iv2755.us.unr.ph, %for.body37.us.preheader ], [ %indvars.iv.next28.us.1, %for.body37.us ]
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv3760, i64 %indvars.iv2755.us
  %6 = bitcast double* %arrayidx41.us to <2 x double>*
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2755.us, i64 %indvars.iv3458.us
  %7 = load double, double* %arrayidx45.us, align 8
  %indvars.iv.next28.us = add nuw nsw i64 %indvars.iv2755.us, 1
  %8 = load <2 x double>, <2 x double>* %6, align 8
  %arrayidx45.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next28.us, i64 %indvars.iv3458.us
  %9 = load double, double* %arrayidx45.us.1, align 8
  %mul46.us.v.i1.1 = insertelement <2 x double> undef, double %7, i32 0
  %mul46.us.v.i1.2 = insertelement <2 x double> %mul46.us.v.i1.1, double %9, i32 1
  %mul46.us = fmul <2 x double> %8, %mul46.us.v.i1.2
  %mul46.us.v.r1 = extractelement <2 x double> %mul46.us, i32 0
  %mul46.us.v.r2 = extractelement <2 x double> %mul46.us, i32 1
  %sub47.us = fsub double %5, %mul46.us.v.r1
  %sub47.us.1 = fsub double %sub47.us, %mul46.us.v.r2
  %indvars.iv.next28.us.1 = add nsw i64 %indvars.iv2755.us, 2
  %exitcond31.us.1 = icmp eq i64 %indvars.iv.next28.us.1, %indvars.iv3760
  br i1 %exitcond31.us.1, label %for.cond35.for.end50_crit_edge.us.loopexit, label %for.body37.us

for.cond35.for.end50_crit_edge.us.loopexit:       ; preds = %for.body37.us
  br label %for.cond35.for.end50_crit_edge.us

for.cond35.for.end50_crit_edge.us:                ; preds = %for.cond35.for.end50_crit_edge.us.loopexit, %for.body37.us.prol.loopexit
  %sub47.us.lcssa = phi double [ %sub47.us.lcssa.unr.ph, %for.body37.us.prol.loopexit ], [ %sub47.us.1, %for.cond35.for.end50_crit_edge.us.loopexit ]
  store double %sub47.us.lcssa, double* %arrayidx34.us, align 8
  %indvars.iv.next35.us = add nuw nsw i64 %indvars.iv3458.us, 1
  %exitcond36.us = icmp eq i64 %indvars.iv.next35.us, 2000
  br i1 %exitcond36.us, label %for.end57, label %for.body30.us

for.body3:                                        ; preds = %for.end, %for.body3.preheader
  %indvars.iv2153 = phi i64 [ 0, %for.body3.preheader ], [ %indvars.iv.next22, %for.end ]
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv3760, i64 %indvars.iv2153
  %10 = load double, double* %arrayidx5, align 8
  %exitcond2049 = icmp eq i64 %indvars.iv2153, 0
  br i1 %exitcond2049, label %for.end, label %for.body8.preheader

for.body8.preheader:                              ; preds = %for.body3
  %xtraiter69 = and i64 %indvars.iv2153, 1
  %lcmp.mod70 = icmp eq i64 %xtraiter69, 0
  br i1 %lcmp.mod70, label %for.body8.prol.loopexit, label %for.body8.prol

for.body8.prol:                                   ; preds = %for.body8.preheader
  %11 = load double, double* %arrayidx12.prol, align 8
  %arrayidx16.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv2153
  %12 = load double, double* %arrayidx16.prol, align 8
  %mul.prol = fmul double %11, %12
  %sub.prol = fsub double %10, %mul.prol
  br label %for.body8.prol.loopexit

for.body8.prol.loopexit:                          ; preds = %for.body8.preheader, %for.body8.prol
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.body8.prol ], [ undef, %for.body8.preheader ]
  %.unr71.ph = phi double [ %sub.prol, %for.body8.prol ], [ %10, %for.body8.preheader ]
  %indvars.iv1650.unr.ph = phi i64 [ 1, %for.body8.prol ], [ 0, %for.body8.preheader ]
  %13 = icmp eq i64 %indvars.iv2153, 1
  br i1 %13, label %for.end, label %for.body8.preheader88

for.body8.preheader88:                            ; preds = %for.body8.prol.loopexit
  br label %for.body8

for.body8:                                        ; preds = %for.body8, %for.body8.preheader88
  %14 = phi double [ %.unr71.ph, %for.body8.preheader88 ], [ %sub.1, %for.body8 ]
  %indvars.iv1650 = phi i64 [ %indvars.iv1650.unr.ph, %for.body8.preheader88 ], [ %indvars.iv.next17.1, %for.body8 ]
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv3760, i64 %indvars.iv1650
  %15 = bitcast double* %arrayidx12 to <2 x double>*
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1650, i64 %indvars.iv2153
  %16 = load double, double* %arrayidx16, align 8
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv1650, 1
  %17 = load <2 x double>, <2 x double>* %15, align 8
  %arrayidx16.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next17, i64 %indvars.iv2153
  %18 = load double, double* %arrayidx16.1, align 8
  %mul.v.i1.1 = insertelement <2 x double> undef, double %16, i32 0
  %mul.v.i1.2 = insertelement <2 x double> %mul.v.i1.1, double %18, i32 1
  %mul = fmul <2 x double> %17, %mul.v.i1.2
  %mul.v.r1 = extractelement <2 x double> %mul, i32 0
  %mul.v.r2 = extractelement <2 x double> %mul, i32 1
  %sub = fsub double %14, %mul.v.r1
  %sub.1 = fsub double %sub, %mul.v.r2
  %indvars.iv.next17.1 = add nsw i64 %indvars.iv1650, 2
  %exitcond20.1 = icmp eq i64 %indvars.iv.next17.1, %indvars.iv2153
  br i1 %exitcond20.1, label %for.end.loopexit, label %for.body8

for.end.loopexit:                                 ; preds = %for.body8
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body8.prol.loopexit, %for.body3
  %.lcssa2 = phi double [ %10, %for.body3 ], [ %sub.lcssa.unr.ph, %for.body8.prol.loopexit ], [ %sub.1, %for.end.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2153, i64 %indvars.iv2153
  %19 = load double, double* %arrayidx20, align 8
  %div = fdiv double %.lcssa2, %19
  store double %div, double* %arrayidx5, align 8
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv2153, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next22, %indvars.iv3760
  br i1 %exitcond26, label %for.body30.us.preheader, label %for.body3

for.end57:                                        ; preds = %for.cond35.for.end50_crit_edge.us
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv3760, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next38, 2000
  br i1 %exitcond39, label %for.body63.preheader, label %for.cond1.preheader.backedge

for.body63.preheader:                             ; preds = %for.end57
  %20 = bitcast double* %y to i64*
  br label %for.body63

for.body63:                                       ; preds = %for.body63.backedge, %for.body63.preheader
  %indvars.iv1348 = phi i64 [ 0, %for.body63.preheader ], [ %indvars.iv1348.be, %for.body63.backedge ]
  %21 = add i64 %indvars.iv1348, -1
  %arrayidx65 = getelementptr inbounds double, double* %b, i64 %indvars.iv1348
  %22 = bitcast double* %arrayidx65 to i64*
  %23 = load i64, i64* %22, align 8
  %24 = bitcast i64 %23 to double
  %exitcond1245 = icmp eq i64 %indvars.iv1348, 0
  br i1 %exitcond1245, label %for.end79.thread, label %for.body68.preheader

for.end79.thread:                                 ; preds = %for.body63
  store i64 %23, i64* %20, align 8
  br label %for.body63.backedge

for.body68.preheader:                             ; preds = %for.body63
  %xtraiter65 = and i64 %indvars.iv1348, 3
  %lcmp.mod66 = icmp eq i64 %xtraiter65, 0
  br i1 %lcmp.mod66, label %for.body68.prol.loopexit, label %for.body68.prol.preheader

for.body68.prol.preheader:                        ; preds = %for.body68.preheader
  br label %for.body68.prol

for.body68.prol:                                  ; preds = %for.body68.prol, %for.body68.prol.preheader
  %25 = phi double [ %24, %for.body68.prol.preheader ], [ %sub76.prol, %for.body68.prol ]
  %indvars.iv846.prol = phi i64 [ 0, %for.body68.prol.preheader ], [ %indvars.iv.next9.prol, %for.body68.prol ]
  %prol.iter67 = phi i64 [ %xtraiter65, %for.body68.prol.preheader ], [ %prol.iter67.sub, %for.body68.prol ]
  %arrayidx72.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1348, i64 %indvars.iv846.prol
  %26 = load double, double* %arrayidx72.prol, align 8
  %arrayidx74.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv846.prol
  %27 = load double, double* %arrayidx74.prol, align 8
  %mul75.prol = fmul double %26, %27
  %sub76.prol = fsub double %25, %mul75.prol
  %indvars.iv.next9.prol = add nuw nsw i64 %indvars.iv846.prol, 1
  %prol.iter67.sub = add nsw i64 %prol.iter67, -1
  %prol.iter67.cmp = icmp eq i64 %prol.iter67.sub, 0
  br i1 %prol.iter67.cmp, label %for.body68.prol.loopexit.loopexit, label %for.body68.prol, !llvm.loop !1

for.body68.prol.loopexit.loopexit:                ; preds = %for.body68.prol
  br label %for.body68.prol.loopexit

for.body68.prol.loopexit:                         ; preds = %for.body68.prol.loopexit.loopexit, %for.body68.preheader
  %sub76.lcssa.unr = phi double [ undef, %for.body68.preheader ], [ %sub76.prol, %for.body68.prol.loopexit.loopexit ]
  %.unr68 = phi double [ %24, %for.body68.preheader ], [ %sub76.prol, %for.body68.prol.loopexit.loopexit ]
  %indvars.iv846.unr = phi i64 [ 0, %for.body68.preheader ], [ %xtraiter65, %for.body68.prol.loopexit.loopexit ]
  %28 = icmp ult i64 %21, 3
  br i1 %28, label %for.end79, label %for.body68.preheader87

for.body68.preheader87:                           ; preds = %for.body68.prol.loopexit
  br label %for.body68

for.body68:                                       ; preds = %for.body68, %for.body68.preheader87
  %29 = phi double [ %.unr68, %for.body68.preheader87 ], [ %sub76.3, %for.body68 ]
  %indvars.iv846 = phi i64 [ %indvars.iv846.unr, %for.body68.preheader87 ], [ %indvars.iv.next9.3, %for.body68 ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1348, i64 %indvars.iv846
  %30 = bitcast double* %arrayidx72 to <2 x double>*
  %arrayidx74 = getelementptr inbounds double, double* %y, i64 %indvars.iv846
  %31 = bitcast double* %arrayidx74 to <2 x double>*
  %32 = load <2 x double>, <2 x double>* %30, align 8
  %33 = load <2 x double>, <2 x double>* %31, align 8
  %mul75 = fmul <2 x double> %32, %33
  %mul75.v.r1 = extractelement <2 x double> %mul75, i32 0
  %mul75.v.r2 = extractelement <2 x double> %mul75, i32 1
  %sub76 = fsub double %29, %mul75.v.r1
  %sub76.1 = fsub double %sub76, %mul75.v.r2
  %indvars.iv.next9.1 = add nsw i64 %indvars.iv846, 2
  %arrayidx72.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1348, i64 %indvars.iv.next9.1
  %34 = bitcast double* %arrayidx72.2 to <2 x double>*
  %arrayidx74.2 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next9.1
  %35 = bitcast double* %arrayidx74.2 to <2 x double>*
  %36 = load <2 x double>, <2 x double>* %34, align 8
  %37 = load <2 x double>, <2 x double>* %35, align 8
  %mul75.2 = fmul <2 x double> %36, %37
  %mul75.2.v.r1 = extractelement <2 x double> %mul75.2, i32 0
  %mul75.2.v.r2 = extractelement <2 x double> %mul75.2, i32 1
  %sub76.2 = fsub double %sub76.1, %mul75.2.v.r1
  %sub76.3 = fsub double %sub76.2, %mul75.2.v.r2
  %indvars.iv.next9.3 = add nsw i64 %indvars.iv846, 4
  %exitcond12.3 = icmp eq i64 %indvars.iv.next9.3, %indvars.iv1348
  br i1 %exitcond12.3, label %for.end79.loopexit, label %for.body68

for.end79.loopexit:                               ; preds = %for.body68
  br label %for.end79

for.end79:                                        ; preds = %for.end79.loopexit, %for.body68.prol.loopexit
  %sub76.lcssa = phi double [ %sub76.lcssa.unr, %for.body68.prol.loopexit ], [ %sub76.3, %for.end79.loopexit ]
  %arrayidx81 = getelementptr inbounds double, double* %y, i64 %indvars.iv1348
  store double %sub76.lcssa, double* %arrayidx81, align 8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv1348, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 2000
  br i1 %exitcond15, label %for.body88.preheader, label %for.body63.backedge

for.body63.backedge:                              ; preds = %for.end79, %for.end79.thread
  %indvars.iv1348.be = phi i64 [ 1, %for.end79.thread ], [ %indvars.iv.next14, %for.end79 ]
  br label %for.body63

for.body88.preheader:                             ; preds = %for.end79
  br label %for.body88

for.body88:                                       ; preds = %for.body88.preheader, %for.end104.for.body88_crit_edge
  %indvars.iv89 = phi i2 [ 0, %for.body88.preheader ], [ %indvars.iv.next90, %for.end104.for.body88_crit_edge ]
  %indvars.iv = phi i64 [ 1999, %for.body88.preheader ], [ %indvars.iv.next, %for.end104.for.body88_crit_edge ]
  %indvar = phi i64 [ %indvar.next, %for.end104.for.body88_crit_edge ], [ 0, %for.body88.preheader ]
  %38 = zext i2 %indvars.iv89 to i64
  %39 = add i64 %indvars.iv, %38
  %40 = add i64 %indvar, -1
  %arrayidx90 = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %41 = load double, double* %arrayidx90, align 8
  %exitcond41 = icmp eq i64 %indvars.iv, 1999
  br i1 %exitcond41, label %for.end104, label %for.body93.preheader

for.body93.preheader:                             ; preds = %for.body88
  %xtraiter = and i64 %indvar, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body93.prol.loopexit, label %for.body93.prol.preheader

for.body93.prol.preheader:                        ; preds = %for.body93.preheader
  br label %for.body93.prol

for.body93.prol:                                  ; preds = %for.body93.prol, %for.body93.prol.preheader
  %indvars.iv.next542.in.prol = phi i64 [ %indvars.iv, %for.body93.prol.preheader ], [ %indvars.iv.next542.prol, %for.body93.prol ]
  %42 = phi double [ %41, %for.body93.prol.preheader ], [ %sub101.prol, %for.body93.prol ]
  %prol.iter = phi i64 [ %xtraiter, %for.body93.prol.preheader ], [ %prol.iter.sub, %for.body93.prol ]
  %indvars.iv.next542.prol = add nuw nsw i64 %indvars.iv.next542.in.prol, 1
  %arrayidx97.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv.next542.prol
  %43 = load double, double* %arrayidx97.prol, align 8
  %arrayidx99.prol = getelementptr inbounds double, double* %x, i64 %indvars.iv.next542.prol
  %44 = load double, double* %arrayidx99.prol, align 8
  %mul100.prol = fmul double %43, %44
  %sub101.prol = fsub double %42, %mul100.prol
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body93.prol.loopexit.loopexit, label %for.body93.prol, !llvm.loop !3

for.body93.prol.loopexit.loopexit:                ; preds = %for.body93.prol
  br label %for.body93.prol.loopexit

for.body93.prol.loopexit:                         ; preds = %for.body93.prol.loopexit.loopexit, %for.body93.preheader
  %sub101.lcssa.unr = phi double [ undef, %for.body93.preheader ], [ %sub101.prol, %for.body93.prol.loopexit.loopexit ]
  %indvars.iv.next542.in.unr = phi i64 [ %indvars.iv, %for.body93.preheader ], [ %39, %for.body93.prol.loopexit.loopexit ]
  %.unr = phi double [ %41, %for.body93.preheader ], [ %sub101.prol, %for.body93.prol.loopexit.loopexit ]
  %45 = icmp ult i64 %40, 3
  br i1 %45, label %for.end104, label %for.body93.preheader86

for.body93.preheader86:                           ; preds = %for.body93.prol.loopexit
  br label %for.body93

for.body93:                                       ; preds = %for.body93, %for.body93.preheader86
  %indvars.iv.next542.in = phi i64 [ %indvars.iv.next542.in.unr, %for.body93.preheader86 ], [ %indvars.iv.next542.3, %for.body93 ]
  %46 = phi double [ %.unr, %for.body93.preheader86 ], [ %sub101.3, %for.body93 ]
  %indvars.iv.next542 = add nuw nsw i64 %indvars.iv.next542.in, 1
  %arrayidx97 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv.next542
  %47 = bitcast double* %arrayidx97 to <2 x double>*
  %arrayidx99 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next542
  %48 = bitcast double* %arrayidx99 to <2 x double>*
  %49 = load <2 x double>, <2 x double>* %47, align 8
  %50 = load <2 x double>, <2 x double>* %48, align 8
  %mul100 = fmul <2 x double> %49, %50
  %mul100.v.r1 = extractelement <2 x double> %mul100, i32 0
  %mul100.v.r2 = extractelement <2 x double> %mul100, i32 1
  %sub101 = fsub double %46, %mul100.v.r1
  %sub101.1 = fsub double %sub101, %mul100.v.r2
  %indvars.iv.next542.2 = add nsw i64 %indvars.iv.next542.in, 3
  %arrayidx97.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv.next542.2
  %51 = bitcast double* %arrayidx97.2 to <2 x double>*
  %arrayidx99.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next542.2
  %52 = bitcast double* %arrayidx99.2 to <2 x double>*
  %indvars.iv.next542.3 = add nsw i64 %indvars.iv.next542.in, 4
  %53 = load <2 x double>, <2 x double>* %51, align 8
  %54 = load <2 x double>, <2 x double>* %52, align 8
  %mul100.2 = fmul <2 x double> %53, %54
  %mul100.2.v.r1 = extractelement <2 x double> %mul100.2, i32 0
  %mul100.2.v.r2 = extractelement <2 x double> %mul100.2, i32 1
  %sub101.2 = fsub double %sub101.1, %mul100.2.v.r1
  %sub101.3 = fsub double %sub101.2, %mul100.2.v.r2
  %exitcond.3 = icmp eq i64 %indvars.iv.next542.3, 1999
  br i1 %exitcond.3, label %for.end104.loopexit, label %for.body93

for.end104.loopexit:                              ; preds = %for.body93
  br label %for.end104

for.end104:                                       ; preds = %for.end104.loopexit, %for.body93.prol.loopexit, %for.body88
  %.lcssa = phi double [ %41, %for.body88 ], [ %sub101.lcssa.unr, %for.body93.prol.loopexit ], [ %sub101.3, %for.end104.loopexit ]
  %arrayidx108 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv
  %55 = load double, double* %arrayidx108, align 8
  %div109 = fdiv double %.lcssa, %55
  %arrayidx111 = getelementptr inbounds double, double* %x, i64 %indvars.iv
  store double %div109, double* %arrayidx111, align 8
  %cmp87 = icmp sgt i64 %indvars.iv, 0
  br i1 %cmp87, label %for.end104.for.body88_crit_edge, label %for.end113

for.end104.for.body88_crit_edge:                  ; preds = %for.end104
  %indvar.next = add i64 %indvar, 1
  %indvars.iv.next = add i64 %indvars.iv, -1
  %indvars.iv.next90 = add i2 %indvars.iv89, 1
  br label %for.body88

for.end113:                                       ; preds = %for.end104
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly %x) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.body

for.body:                                         ; preds = %if.end, %entry
  %indvars.iv1 = phi i64 [ 0, %entry ], [ %indvars.iv.next, %if.end ]
  %3 = trunc i64 %indvars.iv1 to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #6
  br label %if.end

if.end:                                           ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv1
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %if.end
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
