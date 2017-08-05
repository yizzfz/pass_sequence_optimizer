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
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %call1 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %call2 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %call3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %arraydecay = bitcast i8* %call to [2000 x double]*
  %arraydecay4 = bitcast i8* %call1 to double*
  %arraydecay5 = bitcast i8* %call2 to double*
  %arraydecay6 = bitcast i8* %call3 to double*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay5, double* %arraydecay6)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_ludcmp(i32 2000, [2000 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay5, double* %arraydecay6)
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
  tail call fastcc void @print_array(i32 2000, double* %arraydecay5)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #3
  tail call void @free(i8* %call1) #3
  tail call void @free(i8* %call2) #3
  tail call void @free(i8* %call3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* %A, double* %b, double* %x, double* %y) unnamed_addr #0 {
for.inc.preheader.new:
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.preheader.new
  %indvars.iv150 = phi i64 [ 0, %for.inc.preheader.new ], [ %indvars.iv.next151.1, %for.inc ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv150
  %0 = bitcast double* %arrayidx to <2 x double>*
  %arrayidx3 = getelementptr inbounds double, double* %y, i64 %indvars.iv150
  %1 = bitcast double* %arrayidx3 to <2 x double>*
  %2 = trunc i64 %indvars.iv150 to i32
  %3 = or i32 %2, 1
  %conv4 = sitofp i32 %3 to double
  %arrayidx8 = getelementptr inbounds double, double* %b, i64 %indvars.iv150
  store <2 x double> zeroinitializer, <2 x double>* %0, align 8
  store <2 x double> zeroinitializer, <2 x double>* %1, align 8
  %indvars.iv.next151.1 = add nsw i64 %indvars.iv150, 2
  %4 = trunc i64 %indvars.iv.next151.1 to i32
  %conv4.1 = sitofp i32 %4 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv4, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv4.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 2.000000e+03, double 2.000000e+03>
  %div5 = fmul <2 x double> %div, <double 5.000000e-01, double 5.000000e-01>
  %add6 = fadd <2 x double> %div5, <double 4.000000e+00, double 4.000000e+00>
  %5 = bitcast double* %arrayidx8 to <2 x double>*
  store <2 x double> %add6, <2 x double>* %5, align 8
  %exitcond170.1 = icmp eq i64 %indvars.iv.next151.1, 2000
  br i1 %exitcond170.1, label %for.inc25.lr.ph.preheader, label %for.inc

for.inc25.lr.ph.preheader:                        ; preds = %for.inc
  br label %for.inc25.lr.ph

for.inc25.lr.ph:                                  ; preds = %for.inc25.lr.ph.preheader, %for.inc25.lr.ph.backedge
  %indvars.iv146 = phi i64 [ %indvars.iv.next147, %for.inc25.lr.ph.backedge ], [ 0, %for.inc25.lr.ph.preheader ]
  %indvars.iv144 = phi i64 [ %indvars.iv144.be, %for.inc25.lr.ph.backedge ], [ 1, %for.inc25.lr.ph.preheader ]
  %6 = mul i64 %indvars.iv146, 2001
  %7 = add i64 %6, 1
  %scevgep167 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %7
  %scevgep167168 = bitcast double* %scevgep167 to i8*
  %8 = mul i64 %indvars.iv146, -8
  %9 = add i64 %8, 15992
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.lr.ph, %for.inc25
  %indvars.iv131 = phi i64 [ 0, %for.inc25.lr.ph ], [ %indvars.iv.next132, %for.inc25 ]
  %10 = sub nsw i64 0, %indvars.iv131
  %11 = trunc i64 %10 to i32
  %rem = srem i32 %11, 2000
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, 2.000000e+03
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv146, i64 %indvars.iv131
  store double %add20, double* %arrayidx24, align 8
  %indvars.iv.next132 = add nuw nsw i64 %indvars.iv131, 1
  %exitcond137 = icmp eq i64 %indvars.iv.next132, %indvars.iv144
  br i1 %exitcond137, label %for.end27, label %for.inc25

for.end27:                                        ; preds = %for.inc25
  %indvars.iv.next147 = add nuw nsw i64 %indvars.iv146, 1
  %cmp3079 = icmp slt i64 %indvars.iv.next147, 2000
  br i1 %cmp3079, label %for.inc44.thread, label %for.inc44

for.inc44.thread:                                 ; preds = %for.end27
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep167168, i8 0, i64 %9, i32 8, i1 false)
  %arrayidx43175 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv146, i64 %indvars.iv146
  store double 1.000000e+00, double* %arrayidx43175, align 8
  br label %for.inc25.lr.ph.backedge

for.inc44:                                        ; preds = %for.end27
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv146, i64 %indvars.iv146
  store double 1.000000e+00, double* %arrayidx43, align 8
  %exitcond169 = icmp eq i64 %indvars.iv.next147, 2000
  br i1 %exitcond169, label %for.cond51.preheader.us.preheader.new, label %for.inc25.lr.ph.backedge

for.inc25.lr.ph.backedge:                         ; preds = %for.inc44, %for.inc44.thread
  %indvars.iv144.be = add nuw nsw i64 %indvars.iv144, 1
  br label %for.inc25.lr.ph

for.cond51.preheader.us.preheader.new:            ; preds = %for.inc44
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %12 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.inc62.us.3

for.cond73.preheader.us.us.preheader:             ; preds = %for.cond73.preheader.us.us.preheader.preheader, %for.inc96.us
  %indvars.iv119 = phi i64 [ %indvars.iv.next120, %for.inc96.us ], [ 0, %for.cond73.preheader.us.us.preheader.preheader ]
  br label %for.cond73.preheader.us.us.new

for.inc96.us:                                     ; preds = %for.inc93.us.us
  %indvars.iv.next120 = add nuw nsw i64 %indvars.iv119, 1
  %exitcond160 = icmp eq i64 %indvars.iv.next120, 2000
  br i1 %exitcond160, label %for.cond103.preheader.us.new.preheader, label %for.cond73.preheader.us.us.preheader

for.cond103.preheader.us.new.preheader:           ; preds = %for.inc96.us
  br label %for.cond103.preheader.us.new

for.cond73.preheader.us.us.new:                   ; preds = %for.cond73.preheader.us.us.preheader, %for.inc93.us.us
  %indvars.iv115 = phi i64 [ 0, %for.cond73.preheader.us.us.preheader ], [ %indvars.iv.next116, %for.inc93.us.us ]
  %arrayidx80.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv115, i64 %indvars.iv119
  br label %for.inc90.us.us

for.inc93.us.us:                                  ; preds = %for.inc90.us.us
  %indvars.iv.next116 = add nuw nsw i64 %indvars.iv115, 1
  %exitcond159 = icmp eq i64 %indvars.iv.next116, 2000
  br i1 %exitcond159, label %for.inc96.us, label %for.cond73.preheader.us.us.new

for.inc90.us.us:                                  ; preds = %for.inc90.us.us, %for.cond73.preheader.us.us.new
  %indvars.iv111 = phi i64 [ 0, %for.cond73.preheader.us.us.new ], [ %indvars.iv.next112.1, %for.inc90.us.us ]
  %13 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv111, i64 %indvars.iv119
  %14 = load double, double* %arrayidx84.us.us, align 8
  %mul.us.us = fmul double %13, %14
  %arrayidx88.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %12, i64 0, i64 %indvars.iv115, i64 %indvars.iv111
  %15 = load double, double* %arrayidx88.us.us, align 8
  %add89.us.us = fadd double %15, %mul.us.us
  store double %add89.us.us, double* %arrayidx88.us.us, align 8
  %indvars.iv.next112 = or i64 %indvars.iv111, 1
  %16 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next112, i64 %indvars.iv119
  %17 = load double, double* %arrayidx84.us.us.1, align 8
  %mul.us.us.1 = fmul double %16, %17
  %arrayidx88.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %12, i64 0, i64 %indvars.iv115, i64 %indvars.iv.next112
  %18 = load double, double* %arrayidx88.us.us.1, align 8
  %add89.us.us.1 = fadd double %18, %mul.us.us.1
  store double %add89.us.us.1, double* %arrayidx88.us.us.1, align 8
  %indvars.iv.next112.1 = add nsw i64 %indvars.iv111, 2
  %exitcond156.1 = icmp eq i64 %indvars.iv.next112.1, 2000
  br i1 %exitcond156.1, label %for.inc93.us.us, label %for.inc90.us.us

for.cond103.preheader.us.new:                     ; preds = %for.cond103.preheader.us.new.preheader, %for.inc118.us
  %indvars.iv106 = phi i64 [ %indvars.iv.next107, %for.inc118.us ], [ 0, %for.cond103.preheader.us.new.preheader ]
  br label %for.inc115.us

for.inc115.us:                                    ; preds = %for.inc115.us, %for.cond103.preheader.us.new
  %indvars.iv = phi i64 [ 0, %for.cond103.preheader.us.new ], [ %indvars.iv.next.3, %for.inc115.us ]
  %arrayidx110.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %12, i64 0, i64 %indvars.iv106, i64 %indvars.iv
  %19 = bitcast double* %arrayidx110.us to i64*
  %20 = load i64, i64* %19, align 8
  %arrayidx114.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv106, i64 %indvars.iv
  %21 = bitcast double* %arrayidx114.us to i64*
  store i64 %20, i64* %21, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx110.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %12, i64 0, i64 %indvars.iv106, i64 %indvars.iv.next
  %22 = bitcast double* %arrayidx110.us.1 to i64*
  %23 = load i64, i64* %22, align 8
  %arrayidx114.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv106, i64 %indvars.iv.next
  %24 = bitcast double* %arrayidx114.us.1 to i64*
  store i64 %23, i64* %24, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %arrayidx110.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %12, i64 0, i64 %indvars.iv106, i64 %indvars.iv.next.1
  %25 = bitcast double* %arrayidx110.us.2 to i64*
  %26 = load i64, i64* %25, align 8
  %arrayidx114.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv106, i64 %indvars.iv.next.1
  %27 = bitcast double* %arrayidx114.us.2 to i64*
  store i64 %26, i64* %27, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %arrayidx110.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %12, i64 0, i64 %indvars.iv106, i64 %indvars.iv.next.2
  %28 = bitcast double* %arrayidx110.us.3 to i64*
  %29 = load i64, i64* %28, align 8
  %arrayidx114.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv106, i64 %indvars.iv.next.2
  %30 = bitcast double* %arrayidx114.us.3 to i64*
  store i64 %29, i64* %30, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond154.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond154.3, label %for.inc118.us, label %for.inc115.us

for.inc118.us:                                    ; preds = %for.inc115.us
  %indvars.iv.next107 = add nuw nsw i64 %indvars.iv106, 1
  %exitcond = icmp eq i64 %indvars.iv.next107, 2000
  br i1 %exitcond, label %for.end120, label %for.cond103.preheader.us.new

for.end120:                                       ; preds = %for.inc118.us
  tail call void @free(i8* nonnull %call) #3
  ret void

for.inc62.us.3:                                   ; preds = %for.inc62.us.3, %for.cond51.preheader.us.preheader.new
  %indvars.iv127 = phi i64 [ 0, %for.cond51.preheader.us.preheader.new ], [ %indvars.iv.next128.3.1, %for.inc62.us.3 ]
  %31 = mul nuw nsw i64 %indvars.iv127, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %31
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next128 = or i64 %indvars.iv127, 1
  %32 = mul nuw nsw i64 %indvars.iv.next128, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %32
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next128.1 = or i64 %indvars.iv127, 2
  %33 = mul nuw nsw i64 %indvars.iv.next128.1, 16000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %33
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next128.2 = or i64 %indvars.iv127, 3
  %34 = mul nuw nsw i64 %indvars.iv.next128.2, 16000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %34
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next128.3 = or i64 %indvars.iv127, 4
  %35 = mul nuw nsw i64 %indvars.iv.next128.3, 16000
  %scevgep.1178 = getelementptr i8, i8* %call, i64 %35
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1178, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next128.1179 = or i64 %indvars.iv127, 5
  %36 = mul nuw nsw i64 %indvars.iv.next128.1179, 16000
  %scevgep.1.1 = getelementptr i8, i8* %call, i64 %36
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next128.1.1 = or i64 %indvars.iv127, 6
  %37 = mul nuw nsw i64 %indvars.iv.next128.1.1, 16000
  %scevgep.2.1 = getelementptr i8, i8* %call, i64 %37
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next128.2.1 = or i64 %indvars.iv127, 7
  %38 = mul nuw nsw i64 %indvars.iv.next128.2.1, 16000
  %scevgep.3.1 = getelementptr i8, i8* %call, i64 %38
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next128.3.1 = add nsw i64 %indvars.iv127, 8
  %exitcond162.3.1 = icmp eq i64 %indvars.iv.next128.3.1, 2000
  br i1 %exitcond162.3.1, label %for.cond73.preheader.us.us.preheader.preheader, label %for.inc62.us.3

for.cond73.preheader.us.us.preheader.preheader:   ; preds = %for.inc62.us.3
  br label %for.cond73.preheader.us.us.preheader
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32 %n, [2000 x double]* %A, double* %b, double* %x, double* %y) unnamed_addr #0 {
for.cond1.preheader.preheader:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc58, %for.cond1.preheader.preheader
  %indvars.iv144 = phi i64 [ 0, %for.cond1.preheader.preheader ], [ %indvars.iv.next145, %for.inc58 ]
  %cmp294 = icmp sgt i64 %indvars.iv144, 0
  br i1 %cmp294, label %for.body3.preheader, label %for.inc58

for.body3.preheader:                              ; preds = %for.cond1.preheader
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv144, i64 0
  br label %for.body3

for.body30.us.preheader:                          ; preds = %for.inc25
  %xtraiter154 = and i64 %indvars.iv144, 1
  %lcmp.mod155 = icmp eq i64 %xtraiter154, 0
  %0 = icmp eq i64 %indvars.iv144, 1
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.body30.us.preheader, %for.inc55.us
  %indvars.iv140 = phi i64 [ %indvars.iv.next141, %for.inc55.us ], [ %indvars.iv144, %for.body30.us.preheader ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv144, i64 %indvars.iv140
  %1 = load double, double* %arrayidx34.us, align 8
  br i1 %lcmp.mod155, label %for.inc48.us.prol.loopexit, label %for.inc48.us.prol

for.inc48.us.prol:                                ; preds = %for.body30.us
  %2 = load double, double* %arrayidx12.prol, align 8
  %arrayidx45.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv140
  %3 = load double, double* %arrayidx45.us.prol, align 8
  %mul46.us.prol = fmul double %2, %3
  %sub47.us.prol = fsub double %1, %mul46.us.prol
  br label %for.inc48.us.prol.loopexit

for.inc48.us.prol.loopexit:                       ; preds = %for.inc48.us.prol, %for.body30.us
  %sub47.us.lcssa.unr.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ undef, %for.body30.us ]
  %indvars.iv134.unr.ph = phi i64 [ 1, %for.inc48.us.prol ], [ 0, %for.body30.us ]
  %w.198.us.unr.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ %1, %for.body30.us ]
  br i1 %0, label %for.inc55.us, label %for.inc48.us.preheader

for.inc48.us.preheader:                           ; preds = %for.inc48.us.prol.loopexit
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us.preheader, %for.inc48.us
  %indvars.iv134 = phi i64 [ %indvars.iv.next135.1, %for.inc48.us ], [ %indvars.iv134.unr.ph, %for.inc48.us.preheader ]
  %w.198.us = phi double [ %sub47.us.1, %for.inc48.us ], [ %w.198.us.unr.ph, %for.inc48.us.preheader ]
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv144, i64 %indvars.iv134
  %4 = bitcast double* %arrayidx41.us to <2 x double>*
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv134, i64 %indvars.iv140
  %5 = load double, double* %arrayidx45.us, align 8
  %indvars.iv.next135 = add nuw nsw i64 %indvars.iv134, 1
  %6 = load <2 x double>, <2 x double>* %4, align 8
  %arrayidx45.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next135, i64 %indvars.iv140
  %7 = load double, double* %arrayidx45.us.1, align 8
  %mul46.us.v.i1.1 = insertelement <2 x double> undef, double %5, i32 0
  %mul46.us.v.i1.2 = insertelement <2 x double> %mul46.us.v.i1.1, double %7, i32 1
  %mul46.us = fmul <2 x double> %6, %mul46.us.v.i1.2
  %mul46.us.v.r1 = extractelement <2 x double> %mul46.us, i32 0
  %mul46.us.v.r2 = extractelement <2 x double> %mul46.us, i32 1
  %sub47.us = fsub double %w.198.us, %mul46.us.v.r1
  %sub47.us.1 = fsub double %sub47.us, %mul46.us.v.r2
  %indvars.iv.next135.1 = add nsw i64 %indvars.iv134, 2
  %exitcond137.1 = icmp eq i64 %indvars.iv.next135.1, %indvars.iv144
  br i1 %exitcond137.1, label %for.inc55.us.loopexit, label %for.inc48.us

for.inc55.us.loopexit:                            ; preds = %for.inc48.us
  br label %for.inc55.us

for.inc55.us:                                     ; preds = %for.inc55.us.loopexit, %for.inc48.us.prol.loopexit
  %sub47.us.lcssa = phi double [ %sub47.us.lcssa.unr.ph, %for.inc48.us.prol.loopexit ], [ %sub47.us.1, %for.inc55.us.loopexit ]
  store double %sub47.us.lcssa, double* %arrayidx34.us, align 8
  %indvars.iv.next141 = add nuw nsw i64 %indvars.iv140, 1
  %exitcond156 = icmp eq i64 %indvars.iv.next141, 2000
  br i1 %exitcond156, label %for.inc58.loopexit, label %for.body30.us

for.body3:                                        ; preds = %for.body3.preheader, %for.inc25
  %indvars.iv125 = phi i64 [ %indvars.iv.next126, %for.inc25 ], [ 0, %for.body3.preheader ]
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv144, i64 %indvars.iv125
  %8 = load double, double* %arrayidx5, align 8
  %cmp790 = icmp sgt i64 %indvars.iv125, 0
  br i1 %cmp790, label %for.inc.preheader, label %for.inc25

for.inc.preheader:                                ; preds = %for.body3
  %xtraiter151 = and i64 %indvars.iv125, 1
  %lcmp.mod152 = icmp eq i64 %xtraiter151, 0
  br i1 %lcmp.mod152, label %for.inc.prol.loopexit, label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.preheader
  %9 = load double, double* %arrayidx12.prol, align 8
  %arrayidx16.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv125
  %10 = load double, double* %arrayidx16.prol, align 8
  %mul.prol = fmul double %9, %10
  %sub.prol = fsub double %8, %mul.prol
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol, %for.inc.preheader
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ undef, %for.inc.preheader ]
  %indvars.iv120.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.preheader ]
  %w.092.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ %8, %for.inc.preheader ]
  %11 = icmp eq i64 %indvars.iv125, 1
  br i1 %11, label %for.inc25, label %for.inc.preheader167

for.inc.preheader167:                             ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader167, %for.inc
  %indvars.iv120 = phi i64 [ %indvars.iv.next121.1, %for.inc ], [ %indvars.iv120.unr.ph, %for.inc.preheader167 ]
  %w.092 = phi double [ %sub.1, %for.inc ], [ %w.092.unr.ph, %for.inc.preheader167 ]
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv144, i64 %indvars.iv120
  %12 = bitcast double* %arrayidx12 to <2 x double>*
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv120, i64 %indvars.iv125
  %13 = load double, double* %arrayidx16, align 8
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  %14 = load <2 x double>, <2 x double>* %12, align 8
  %arrayidx16.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next121, i64 %indvars.iv125
  %15 = load double, double* %arrayidx16.1, align 8
  %mul.v.i1.1 = insertelement <2 x double> undef, double %13, i32 0
  %mul.v.i1.2 = insertelement <2 x double> %mul.v.i1.1, double %15, i32 1
  %mul = fmul <2 x double> %14, %mul.v.i1.2
  %mul.v.r1 = extractelement <2 x double> %mul, i32 0
  %mul.v.r2 = extractelement <2 x double> %mul, i32 1
  %sub = fsub double %w.092, %mul.v.r1
  %sub.1 = fsub double %sub, %mul.v.r2
  %indvars.iv.next121.1 = add nsw i64 %indvars.iv120, 2
  %exitcond124.1 = icmp eq i64 %indvars.iv.next121.1, %indvars.iv125
  br i1 %exitcond124.1, label %for.inc25.loopexit, label %for.inc

for.inc25.loopexit:                               ; preds = %for.inc
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.inc.prol.loopexit, %for.body3
  %w.0.lcssa = phi double [ %8, %for.body3 ], [ %sub.lcssa.unr.ph, %for.inc.prol.loopexit ], [ %sub.1, %for.inc25.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv125, i64 %indvars.iv125
  %16 = load double, double* %arrayidx20, align 8
  %div = fdiv double %w.0.lcssa, %16
  store double %div, double* %arrayidx5, align 8
  %indvars.iv.next126 = add nuw nsw i64 %indvars.iv125, 1
  %exitcond128 = icmp eq i64 %indvars.iv.next126, %indvars.iv144
  br i1 %exitcond128, label %for.body30.us.preheader, label %for.body3

for.inc58.loopexit:                               ; preds = %for.inc55.us
  br label %for.inc58

for.inc58:                                        ; preds = %for.inc58.loopexit, %for.cond1.preheader
  %indvars.iv.next145 = add nuw nsw i64 %indvars.iv144, 1
  %exitcond157 = icmp eq i64 %indvars.iv.next145, 2000
  br i1 %exitcond157, label %for.body63.preheader, label %for.cond1.preheader

for.body63.preheader:                             ; preds = %for.inc58
  br label %for.body63

for.body63:                                       ; preds = %for.body63.preheader, %for.inc82
  %indvars.iv116 = phi i64 [ %indvars.iv.next117, %for.inc82 ], [ 0, %for.body63.preheader ]
  %17 = add nsw i64 %indvars.iv116, -1
  %arrayidx65 = getelementptr inbounds double, double* %b, i64 %indvars.iv116
  %18 = load double, double* %arrayidx65, align 8
  %cmp6784 = icmp sgt i64 %indvars.iv116, 0
  br i1 %cmp6784, label %for.inc77.preheader, label %for.inc82

for.inc77.preheader:                              ; preds = %for.body63
  %xtraiter148 = and i64 %indvars.iv116, 3
  %lcmp.mod149 = icmp eq i64 %xtraiter148, 0
  br i1 %lcmp.mod149, label %for.inc77.prol.loopexit, label %for.inc77.prol.preheader

for.inc77.prol.preheader:                         ; preds = %for.inc77.preheader
  br label %for.inc77.prol

for.inc77.prol:                                   ; preds = %for.inc77.prol.preheader, %for.inc77.prol
  %indvars.iv111.prol = phi i64 [ %indvars.iv.next112.prol, %for.inc77.prol ], [ 0, %for.inc77.prol.preheader ]
  %w.286.prol = phi double [ %sub76.prol, %for.inc77.prol ], [ %18, %for.inc77.prol.preheader ]
  %prol.iter150 = phi i64 [ %prol.iter150.sub, %for.inc77.prol ], [ %xtraiter148, %for.inc77.prol.preheader ]
  %arrayidx72.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv116, i64 %indvars.iv111.prol
  %19 = load double, double* %arrayidx72.prol, align 8
  %arrayidx74.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv111.prol
  %20 = load double, double* %arrayidx74.prol, align 8
  %mul75.prol = fmul double %19, %20
  %sub76.prol = fsub double %w.286.prol, %mul75.prol
  %indvars.iv.next112.prol = add nuw nsw i64 %indvars.iv111.prol, 1
  %prol.iter150.sub = add i64 %prol.iter150, -1
  %prol.iter150.cmp = icmp eq i64 %prol.iter150.sub, 0
  br i1 %prol.iter150.cmp, label %for.inc77.prol.loopexit.loopexit, label %for.inc77.prol, !llvm.loop !1

for.inc77.prol.loopexit.loopexit:                 ; preds = %for.inc77.prol
  br label %for.inc77.prol.loopexit

for.inc77.prol.loopexit:                          ; preds = %for.inc77.prol.loopexit.loopexit, %for.inc77.preheader
  %sub76.lcssa.unr = phi double [ undef, %for.inc77.preheader ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %indvars.iv111.unr = phi i64 [ 0, %for.inc77.preheader ], [ %indvars.iv.next112.prol, %for.inc77.prol.loopexit.loopexit ]
  %w.286.unr = phi double [ %18, %for.inc77.preheader ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %21 = icmp ult i64 %17, 3
  br i1 %21, label %for.inc82, label %for.inc77.preheader166

for.inc77.preheader166:                           ; preds = %for.inc77.prol.loopexit
  br label %for.inc77

for.inc77:                                        ; preds = %for.inc77.preheader166, %for.inc77
  %indvars.iv111 = phi i64 [ %indvars.iv.next112.3, %for.inc77 ], [ %indvars.iv111.unr, %for.inc77.preheader166 ]
  %w.286 = phi double [ %sub76.3, %for.inc77 ], [ %w.286.unr, %for.inc77.preheader166 ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv116, i64 %indvars.iv111
  %22 = bitcast double* %arrayidx72 to <2 x double>*
  %arrayidx74 = getelementptr inbounds double, double* %y, i64 %indvars.iv111
  %23 = bitcast double* %arrayidx74 to <2 x double>*
  %24 = load <2 x double>, <2 x double>* %22, align 8
  %25 = load <2 x double>, <2 x double>* %23, align 8
  %mul75 = fmul <2 x double> %24, %25
  %mul75.v.r1 = extractelement <2 x double> %mul75, i32 0
  %mul75.v.r2 = extractelement <2 x double> %mul75, i32 1
  %sub76 = fsub double %w.286, %mul75.v.r1
  %sub76.1 = fsub double %sub76, %mul75.v.r2
  %indvars.iv.next112.1 = add nsw i64 %indvars.iv111, 2
  %arrayidx72.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv116, i64 %indvars.iv.next112.1
  %26 = bitcast double* %arrayidx72.2 to <2 x double>*
  %arrayidx74.2 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next112.1
  %27 = bitcast double* %arrayidx74.2 to <2 x double>*
  %28 = load <2 x double>, <2 x double>* %26, align 8
  %29 = load <2 x double>, <2 x double>* %27, align 8
  %mul75.2 = fmul <2 x double> %28, %29
  %mul75.2.v.r1 = extractelement <2 x double> %mul75.2, i32 0
  %mul75.2.v.r2 = extractelement <2 x double> %mul75.2, i32 1
  %sub76.2 = fsub double %sub76.1, %mul75.2.v.r1
  %sub76.3 = fsub double %sub76.2, %mul75.2.v.r2
  %indvars.iv.next112.3 = add nsw i64 %indvars.iv111, 4
  %exitcond115.3 = icmp eq i64 %indvars.iv.next112.3, %indvars.iv116
  br i1 %exitcond115.3, label %for.inc82.loopexit, label %for.inc77

for.inc82.loopexit:                               ; preds = %for.inc77
  br label %for.inc82

for.inc82:                                        ; preds = %for.inc82.loopexit, %for.inc77.prol.loopexit, %for.body63
  %w.2.lcssa = phi double [ %18, %for.body63 ], [ %sub76.lcssa.unr, %for.inc77.prol.loopexit ], [ %sub76.3, %for.inc82.loopexit ]
  %arrayidx81 = getelementptr inbounds double, double* %y, i64 %indvars.iv116
  store double %w.2.lcssa, double* %arrayidx81, align 8
  %indvars.iv.next117 = add nuw nsw i64 %indvars.iv116, 1
  %exitcond = icmp eq i64 %indvars.iv.next117, 2000
  br i1 %exitcond, label %for.body88.preheader, label %for.body63

for.body88.preheader:                             ; preds = %for.inc82
  br label %for.body88

for.body88:                                       ; preds = %for.body88.preheader, %for.inc112
  %indvar = phi i32 [ %indvar.next, %for.inc112 ], [ 0, %for.body88.preheader ]
  %indvars.iv108.in = phi i64 [ %indvars.iv108, %for.inc112 ], [ 2000, %for.body88.preheader ]
  %30 = add nsw i32 %indvar, -1
  %indvars.iv108 = add nsw i64 %indvars.iv108.in, -1
  %arrayidx90 = getelementptr inbounds double, double* %y, i64 %indvars.iv108
  %31 = load double, double* %arrayidx90, align 8
  %cmp9278 = icmp slt i64 %indvars.iv108.in, 2000
  br i1 %cmp9278, label %for.inc102.preheader, label %for.inc112

for.inc102.preheader:                             ; preds = %for.body88
  %xtraiter = and i32 %indvar, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc102.prol.loopexit, label %for.inc102.prol.preheader

for.inc102.prol.preheader:                        ; preds = %for.inc102.preheader
  br label %for.inc102.prol

for.inc102.prol:                                  ; preds = %for.inc102.prol.preheader, %for.inc102.prol
  %indvars.iv106.prol = phi i64 [ %indvars.iv.next107.prol, %for.inc102.prol ], [ %indvars.iv108.in, %for.inc102.prol.preheader ]
  %w.379.prol = phi double [ %sub101.prol, %for.inc102.prol ], [ %31, %for.inc102.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.inc102.prol ], [ %xtraiter, %for.inc102.prol.preheader ]
  %arrayidx97.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv108, i64 %indvars.iv106.prol
  %32 = load double, double* %arrayidx97.prol, align 8
  %arrayidx99.prol = getelementptr inbounds double, double* %x, i64 %indvars.iv106.prol
  %33 = load double, double* %arrayidx99.prol, align 8
  %mul100.prol = fmul double %32, %33
  %sub101.prol = fsub double %w.379.prol, %mul100.prol
  %indvars.iv.next107.prol = add nsw i64 %indvars.iv106.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc102.prol.loopexit.loopexit, label %for.inc102.prol, !llvm.loop !3

for.inc102.prol.loopexit.loopexit:                ; preds = %for.inc102.prol
  br label %for.inc102.prol.loopexit

for.inc102.prol.loopexit:                         ; preds = %for.inc102.prol.loopexit.loopexit, %for.inc102.preheader
  %sub101.lcssa.unr = phi double [ undef, %for.inc102.preheader ], [ %sub101.prol, %for.inc102.prol.loopexit.loopexit ]
  %indvars.iv106.unr = phi i64 [ %indvars.iv108.in, %for.inc102.preheader ], [ %indvars.iv.next107.prol, %for.inc102.prol.loopexit.loopexit ]
  %w.379.unr = phi double [ %31, %for.inc102.preheader ], [ %sub101.prol, %for.inc102.prol.loopexit.loopexit ]
  %34 = icmp ult i32 %30, 3
  br i1 %34, label %for.inc112, label %for.inc102.preheader165

for.inc102.preheader165:                          ; preds = %for.inc102.prol.loopexit
  br label %for.inc102

for.inc102:                                       ; preds = %for.inc102.preheader165, %for.inc102
  %indvars.iv106 = phi i64 [ %indvars.iv.next107.3, %for.inc102 ], [ %indvars.iv106.unr, %for.inc102.preheader165 ]
  %w.379 = phi double [ %sub101.3, %for.inc102 ], [ %w.379.unr, %for.inc102.preheader165 ]
  %arrayidx97 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv108, i64 %indvars.iv106
  %35 = bitcast double* %arrayidx97 to <2 x double>*
  %arrayidx99 = getelementptr inbounds double, double* %x, i64 %indvars.iv106
  %36 = bitcast double* %arrayidx99 to <2 x double>*
  %37 = load <2 x double>, <2 x double>* %35, align 8
  %38 = load <2 x double>, <2 x double>* %36, align 8
  %mul100 = fmul <2 x double> %37, %38
  %mul100.v.r1 = extractelement <2 x double> %mul100, i32 0
  %mul100.v.r2 = extractelement <2 x double> %mul100, i32 1
  %sub101 = fsub double %w.379, %mul100.v.r1
  %sub101.1 = fsub double %sub101, %mul100.v.r2
  %indvars.iv.next107.1 = add nsw i64 %indvars.iv106, 2
  %arrayidx97.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv108, i64 %indvars.iv.next107.1
  %39 = bitcast double* %arrayidx97.2 to <2 x double>*
  %arrayidx99.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next107.1
  %40 = bitcast double* %arrayidx99.2 to <2 x double>*
  %41 = load <2 x double>, <2 x double>* %39, align 8
  %42 = load <2 x double>, <2 x double>* %40, align 8
  %mul100.2 = fmul <2 x double> %41, %42
  %mul100.2.v.r1 = extractelement <2 x double> %mul100.2, i32 0
  %mul100.2.v.r2 = extractelement <2 x double> %mul100.2, i32 1
  %sub101.2 = fsub double %sub101.1, %mul100.2.v.r1
  %sub101.3 = fsub double %sub101.2, %mul100.2.v.r2
  %indvars.iv.next107.3 = add nsw i64 %indvars.iv106, 4
  %lftr.wideiv.3 = trunc i64 %indvars.iv.next107.3 to i32
  %exitcond.3 = icmp eq i32 %lftr.wideiv.3, 2000
  br i1 %exitcond.3, label %for.inc112.loopexit, label %for.inc102

for.inc112.loopexit:                              ; preds = %for.inc102
  br label %for.inc112

for.inc112:                                       ; preds = %for.inc112.loopexit, %for.inc102.prol.loopexit, %for.body88
  %w.3.lcssa = phi double [ %31, %for.body88 ], [ %sub101.lcssa.unr, %for.inc102.prol.loopexit ], [ %sub101.3, %for.inc112.loopexit ]
  %arrayidx108 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv108, i64 %indvars.iv108
  %43 = load double, double* %arrayidx108, align 8
  %div109 = fdiv double %w.3.lcssa, %43
  %arrayidx111 = getelementptr inbounds double, double* %x, i64 %indvars.iv108
  store double %div109, double* %arrayidx111, align 8
  %cmp87 = icmp sgt i64 %indvars.iv108.in, 1
  %indvar.next = add nuw nsw i32 %indvar, 1
  br i1 %cmp87, label %for.body88, label %for.end113

for.end113:                                       ; preds = %for.inc112
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* %x) unnamed_addr #0 {
for.body.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body

for.body:                                         ; preds = %for.inc, %for.body.preheader
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %for.inc ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond6, label %for.end, label %for.body

for.end:                                          ; preds = %for.inc
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #5
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
