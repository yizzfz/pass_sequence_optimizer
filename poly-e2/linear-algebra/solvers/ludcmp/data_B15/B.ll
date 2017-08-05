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
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay5, double* %arraydecay6)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_ludcmp(i32 2000, [2000 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay5, double* %arraydecay6)
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
  tail call fastcc void @print_array(i32 2000, double* %1)
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
define internal fastcc void @init_array(i32 %n, [2000 x double]* nocapture %A, double* nocapture %b, double* nocapture %x, double* nocapture %y) unnamed_addr #0 {
entry:
  %conv = sitofp i32 %n to double
  %cmp21 = icmp sgt i32 %n, 0
  br i1 %cmp21, label %for.inc.preheader, label %for.end46.thread

for.inc.preheader:                                ; preds = %entry
  %xtraiter105 = and i32 %n, 1
  %lcmp.mod106 = icmp eq i32 %xtraiter105, 0
  br i1 %lcmp.mod106, label %for.inc.prol.loopexit, label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.preheader
  store double 0.000000e+00, double* %x, align 8
  store double 0.000000e+00, double* %y, align 8
  %div.prol = fdiv double 1.000000e+00, %conv
  %div5.prol = fmul double %div.prol, 5.000000e-01
  %add6.prol = fadd double %div5.prol, 4.000000e+00
  store double %add6.prol, double* %b, align 8
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.preheader, %for.inc.prol
  %indvars.iv99.unr = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.preheader ]
  %0 = icmp eq i32 %n, 1
  br i1 %0, label %for.cond13.preheader.preheader, label %for.inc.preheader121

for.inc.preheader121:                             ; preds = %for.inc.prol.loopexit
  %1 = insertelement <2 x double> undef, double %conv, i32 0
  %div.v.i1.2 = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  %wide.trip.count101.1 = zext i32 %n to i64
  br label %for.inc

for.cond9.preheader:                              ; preds = %for.inc
  %cmp1019 = icmp sgt i32 %n, 0
  br i1 %cmp1019, label %for.cond13.preheader.preheader, label %for.end46.thread

for.cond13.preheader.preheader:                   ; preds = %for.cond9.preheader, %for.inc.prol.loopexit
  %2 = add i32 %n, -2
  %3 = zext i32 %2 to i64
  %4 = sext i32 %n to i64
  %wide.trip.count97 = zext i32 %n to i64
  br label %for.inc25.lr.ph

for.inc:                                          ; preds = %for.inc, %for.inc.preheader121
  %indvars.iv99 = phi i64 [ %indvars.iv99.unr, %for.inc.preheader121 ], [ %indvars.iv.next100.1, %for.inc ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv99
  %5 = bitcast double* %arrayidx to <2 x double>*
  %arrayidx3 = getelementptr inbounds double, double* %y, i64 %indvars.iv99
  %6 = bitcast double* %arrayidx3 to <2 x double>*
  %indvars.iv.next100 = add nuw nsw i64 %indvars.iv99, 1
  %7 = trunc i64 %indvars.iv.next100 to i32
  %conv4 = sitofp i32 %7 to double
  %arrayidx8 = getelementptr inbounds double, double* %b, i64 %indvars.iv99
  store <2 x double> zeroinitializer, <2 x double>* %5, align 8
  store <2 x double> zeroinitializer, <2 x double>* %6, align 8
  %indvars.iv.next100.1 = add nuw nsw i64 %indvars.iv99, 2
  %8 = trunc i64 %indvars.iv.next100.1 to i32
  %conv4.1 = sitofp i32 %8 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv4, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv4.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, %div.v.i1.2
  %div5 = fmul <2 x double> %div, <double 5.000000e-01, double 5.000000e-01>
  %add6 = fadd <2 x double> %div5, <double 4.000000e+00, double 4.000000e+00>
  %9 = bitcast double* %arrayidx8 to <2 x double>*
  store <2 x double> %add6, <2 x double>* %9, align 8
  %exitcond102.1 = icmp eq i64 %indvars.iv.next100.1, %wide.trip.count101.1
  br i1 %exitcond102.1, label %for.cond9.preheader, label %for.inc

for.inc25.lr.ph:                                  ; preds = %for.inc44.for.inc25.lr.ph_crit_edge, %for.cond13.preheader.preheader
  %indvars.iv95 = phi i64 [ 0, %for.cond13.preheader.preheader ], [ %indvars.iv.next96, %for.inc44.for.inc25.lr.ph_crit_edge ]
  %indvars.iv93 = phi i64 [ 1, %for.cond13.preheader.preheader ], [ %indvars.iv.next94, %for.inc44.for.inc25.lr.ph_crit_edge ]
  %10 = mul nuw nsw i64 %indvars.iv95, 2001
  %11 = add nuw nsw i64 %10, 1
  %12 = sub i64 %3, %indvars.iv95
  %13 = shl i64 %12, 3
  %14 = and i64 %13, 34359738360
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25, %for.inc25.lr.ph
  %indvars.iv76 = phi i64 [ 0, %for.inc25.lr.ph ], [ %indvars.iv.next77, %for.inc25 ]
  %15 = sub nsw i64 0, %indvars.iv76
  %16 = trunc i64 %15 to i32
  %rem = srem i32 %16, %n
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, %conv
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv95, i64 %indvars.iv76
  store double %add20, double* %arrayidx24, align 8
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %exitcond84 = icmp eq i64 %indvars.iv.next77, %indvars.iv93
  br i1 %exitcond84, label %for.end27, label %for.inc25

for.end27:                                        ; preds = %for.inc25
  %scevgep91 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %11
  %17 = add nuw nsw i64 %14, 8
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  %cmp3017 = icmp slt i64 %indvars.iv.next96, %4
  br i1 %cmp3017, label %for.inc44.loopexit, label %for.inc44

for.inc44.loopexit:                               ; preds = %for.end27
  %18 = bitcast double* %scevgep91 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %18, i8 0, i64 %17, i32 8, i1 false)
  br label %for.inc44

for.inc44:                                        ; preds = %for.end27, %for.inc44.loopexit
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv95, i64 %indvars.iv95
  store double 1.000000e+00, double* %arrayidx43, align 8
  %exitcond98 = icmp eq i64 %indvars.iv.next96, %wide.trip.count97
  br i1 %exitcond98, label %for.end46, label %for.inc44.for.inc25.lr.ph_crit_edge

for.inc44.for.inc25.lr.ph_crit_edge:              ; preds = %for.inc44
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  br label %for.inc25.lr.ph

for.end46.thread:                                 ; preds = %for.cond9.preheader, %entry
  %call110 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %for.end120

for.end46:                                        ; preds = %for.inc44
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %cmp4813 = icmp sgt i32 %n, 0
  br i1 %cmp4813, label %for.cond51.preheader.us.preheader, label %for.end120

for.cond51.preheader.us.preheader:                ; preds = %for.end46
  %19 = add i32 %n, -1
  %20 = zext i32 %19 to i64
  %21 = shl nuw nsw i64 %20, 3
  %22 = add nuw nsw i64 %21, 8
  %xtraiter73 = and i32 %n, 3
  %lcmp.mod74 = icmp eq i32 %xtraiter73, 0
  br i1 %lcmp.mod74, label %for.cond51.preheader.us.prol.loopexit, label %for.inc62.us.prol.preheader

for.inc62.us.prol.preheader:                      ; preds = %for.cond51.preheader.us.preheader
  %23 = add i32 %xtraiter73, -1
  %24 = zext i32 %23 to i64
  br label %for.inc62.us.prol

for.inc62.us.prol:                                ; preds = %for.inc62.us.prol.preheader, %for.inc62.us.prol
  %indvars.iv69.prol = phi i64 [ %indvars.iv.next70.prol, %for.inc62.us.prol ], [ 0, %for.inc62.us.prol.preheader ]
  %prol.iter75 = phi i32 [ %prol.iter75.sub, %for.inc62.us.prol ], [ %xtraiter73, %for.inc62.us.prol.preheader ]
  %25 = mul nuw nsw i64 %indvars.iv69.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %call, i64 %25
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next70.prol = add nuw nsw i64 %indvars.iv69.prol, 1
  %prol.iter75.sub = add nsw i32 %prol.iter75, -1
  %prol.iter75.cmp = icmp eq i32 %prol.iter75.sub, 0
  br i1 %prol.iter75.cmp, label %for.cond51.preheader.us.prol.loopexit.loopexit, label %for.inc62.us.prol, !llvm.loop !1

for.cond51.preheader.us.prol.loopexit.loopexit:   ; preds = %for.inc62.us.prol
  %26 = add i64 %24, 1
  br label %for.cond51.preheader.us.prol.loopexit

for.cond51.preheader.us.prol.loopexit:            ; preds = %for.cond51.preheader.us.prol.loopexit.loopexit, %for.cond51.preheader.us.preheader
  %indvars.iv69.unr = phi i64 [ 0, %for.cond51.preheader.us.preheader ], [ %26, %for.cond51.preheader.us.prol.loopexit.loopexit ]
  %27 = icmp ult i32 %19, 3
  br i1 %27, label %for.cond69.preheader.lr.ph, label %for.inc62.us.3.preheader

for.inc62.us.3.preheader:                         ; preds = %for.cond51.preheader.us.prol.loopexit
  %wide.trip.count71.3 = zext i32 %n to i64
  %28 = add nsw i64 %wide.trip.count71.3, -4
  %29 = sub i64 %28, %indvars.iv69.unr
  %30 = lshr i64 %29, 2
  %31 = and i64 %30, 1
  %lcmp.mod = icmp eq i64 %31, 0
  br i1 %lcmp.mod, label %for.inc62.us.3.prol.preheader, label %for.inc62.us.3.prol.loopexit

for.inc62.us.3.prol.preheader:                    ; preds = %for.inc62.us.3.preheader
  br label %for.inc62.us.3.prol

for.inc62.us.3.prol:                              ; preds = %for.inc62.us.3.prol.preheader
  %32 = mul nuw nsw i64 %indvars.iv69.unr, 16000
  %scevgep.prol127 = getelementptr i8, i8* %call, i64 %32
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol127, i8 0, i64 %22, i32 8, i1 false)
  %33 = mul i64 %indvars.iv69.unr, 16000
  %34 = add i64 %33, 16000
  %scevgep.1.prol = getelementptr i8, i8* %call, i64 %34
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.prol, i8 0, i64 %22, i32 8, i1 false)
  %35 = mul i64 %indvars.iv69.unr, 16000
  %36 = add i64 %35, 32000
  %scevgep.2.prol = getelementptr i8, i8* %call, i64 %36
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.prol, i8 0, i64 %22, i32 8, i1 false)
  %37 = mul i64 %indvars.iv69.unr, 16000
  %38 = add i64 %37, 48000
  %scevgep.3.prol = getelementptr i8, i8* %call, i64 %38
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.prol, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next70.3.prol = add nsw i64 %indvars.iv69.unr, 4
  br label %for.inc62.us.3.prol.loopexit

for.inc62.us.3.prol.loopexit:                     ; preds = %for.inc62.us.3.prol, %for.inc62.us.3.preheader
  %indvars.iv69.unr128 = phi i64 [ %indvars.iv69.unr, %for.inc62.us.3.preheader ], [ %indvars.iv.next70.3.prol, %for.inc62.us.3.prol ]
  %39 = icmp eq i64 %30, 0
  br i1 %39, label %for.cond65.preheader, label %for.inc62.us.3.preheader.new

for.inc62.us.3.preheader.new:                     ; preds = %for.inc62.us.3.prol.loopexit
  br label %for.inc62.us.3

for.cond65.preheader.unr-lcssa:                   ; preds = %for.inc62.us.3
  br label %for.cond65.preheader

for.cond65.preheader:                             ; preds = %for.inc62.us.3.prol.loopexit, %for.cond65.preheader.unr-lcssa
  %cmp669 = icmp sgt i32 %n, 0
  br i1 %cmp669, label %for.cond69.preheader.lr.ph, label %for.end120

for.cond69.preheader.lr.ph:                       ; preds = %for.cond65.preheader, %for.cond51.preheader.us.prol.loopexit
  %xtraiter55 = and i32 %n, 1
  %wide.trip.count59 = zext i32 %n to i64
  %wide.trip.count53.1 = zext i32 %n to i64
  %wide.trip.count63 = zext i32 %n to i64
  %40 = icmp eq i32 %xtraiter55, 0
  %41 = icmp eq i32 %n, 1
  %42 = bitcast i8* %call to [2000 x [2000 x double]]*
  %43 = bitcast i8* %call to [2000 x [2000 x double]]*
  %sunkaddr = ptrtoint [2000 x double]* %A to i64
  br label %for.cond73.preheader.us.us.preheader

for.cond73.preheader.us.us.preheader:             ; preds = %for.inc96.us, %for.cond69.preheader.lr.ph
  %indvars.iv61 = phi i64 [ 0, %for.cond69.preheader.lr.ph ], [ %indvars.iv.next62, %for.inc96.us ]
  %sunkaddr122 = shl i64 %indvars.iv61, 3
  %sunkaddr123 = add i64 %sunkaddr, %sunkaddr122
  %sunkaddr124 = inttoptr i64 %sunkaddr123 to double*
  br label %for.cond73.preheader.us.us

for.inc96.us:                                     ; preds = %for.inc93.us.us
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next62, %wide.trip.count63
  br i1 %exitcond64, label %for.cond99.preheader, label %for.cond73.preheader.us.us.preheader

for.cond73.preheader.us.us:                       ; preds = %for.inc93.us.us, %for.cond73.preheader.us.us.preheader
  %indvars.iv57 = phi i64 [ 0, %for.cond73.preheader.us.us.preheader ], [ %indvars.iv.next58, %for.inc93.us.us ]
  %arrayidx80.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv57, i64 %indvars.iv61
  br i1 %40, label %for.inc90.us.us.prol.loopexit, label %for.inc90.us.us.prol

for.inc90.us.us.prol:                             ; preds = %for.cond73.preheader.us.us
  %44 = load double, double* %arrayidx80.us.us, align 8
  %45 = load double, double* %sunkaddr124, align 8
  %mul.us.us.prol = fmul double %44, %45
  %arrayidx88.us.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %43, i64 0, i64 %indvars.iv57, i64 0
  %46 = load double, double* %arrayidx88.us.us.prol, align 8
  %add89.us.us.prol = fadd double %46, %mul.us.us.prol
  store double %add89.us.us.prol, double* %arrayidx88.us.us.prol, align 8
  br label %for.inc90.us.us.prol.loopexit

for.inc90.us.us.prol.loopexit:                    ; preds = %for.cond73.preheader.us.us, %for.inc90.us.us.prol
  %indvars.iv51.unr.ph = phi i64 [ 1, %for.inc90.us.us.prol ], [ 0, %for.cond73.preheader.us.us ]
  br i1 %41, label %for.inc93.us.us, label %for.inc90.us.us.preheader

for.inc90.us.us.preheader:                        ; preds = %for.inc90.us.us.prol.loopexit
  br label %for.inc90.us.us

for.inc93.us.us.loopexit:                         ; preds = %for.inc90.us.us
  br label %for.inc93.us.us

for.inc93.us.us:                                  ; preds = %for.inc93.us.us.loopexit, %for.inc90.us.us.prol.loopexit
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next58, %wide.trip.count59
  br i1 %exitcond60, label %for.inc96.us, label %for.cond73.preheader.us.us

for.inc90.us.us:                                  ; preds = %for.inc90.us.us.preheader, %for.inc90.us.us
  %indvars.iv51 = phi i64 [ %indvars.iv.next52.1, %for.inc90.us.us ], [ %indvars.iv51.unr.ph, %for.inc90.us.us.preheader ]
  %47 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv51, i64 %indvars.iv61
  %48 = load double, double* %arrayidx84.us.us, align 8
  %mul.us.us = fmul double %47, %48
  %arrayidx88.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %42, i64 0, i64 %indvars.iv57, i64 %indvars.iv51
  %49 = load double, double* %arrayidx88.us.us, align 8
  %add89.us.us = fadd double %49, %mul.us.us
  store double %add89.us.us, double* %arrayidx88.us.us, align 8
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %50 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next52, i64 %indvars.iv61
  %51 = load double, double* %arrayidx84.us.us.1, align 8
  %mul.us.us.1 = fmul double %50, %51
  %arrayidx88.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %42, i64 0, i64 %indvars.iv57, i64 %indvars.iv.next52
  %52 = load double, double* %arrayidx88.us.us.1, align 8
  %add89.us.us.1 = fadd double %52, %mul.us.us.1
  store double %add89.us.us.1, double* %arrayidx88.us.us.1, align 8
  %indvars.iv.next52.1 = add nuw nsw i64 %indvars.iv51, 2
  %exitcond54.1 = icmp eq i64 %indvars.iv.next52.1, %wide.trip.count53.1
  br i1 %exitcond54.1, label %for.inc93.us.us.loopexit, label %for.inc90.us.us

for.cond99.preheader:                             ; preds = %for.inc96.us
  %cmp1003 = icmp sgt i32 %n, 0
  br i1 %cmp1003, label %for.cond103.preheader.us.preheader, label %for.end120

for.cond103.preheader.us.preheader:               ; preds = %for.cond99.preheader
  %53 = add i32 %n, -1
  %xtraiter = and i32 %n, 3
  %wide.trip.count49 = zext i32 %n to i64
  %wide.trip.count44.3 = zext i32 %n to i64
  %54 = icmp eq i32 %xtraiter, 0
  %55 = icmp ult i32 %53, 3
  %56 = bitcast i8* %call to [2000 x [2000 x double]]*
  %57 = bitcast i8* %call to [2000 x [2000 x double]]*
  %58 = add i32 %xtraiter, -1
  %59 = zext i32 %58 to i64
  %60 = add i64 %59, 1
  br label %for.cond103.preheader.us

for.cond103.preheader.us:                         ; preds = %for.inc118.us, %for.cond103.preheader.us.preheader
  %indvars.iv47 = phi i64 [ 0, %for.cond103.preheader.us.preheader ], [ %indvars.iv.next48, %for.inc118.us ]
  br i1 %54, label %for.inc115.us.prol.loopexit, label %for.inc115.us.prol.preheader

for.inc115.us.prol.preheader:                     ; preds = %for.cond103.preheader.us
  br label %for.inc115.us.prol

for.inc115.us.prol:                               ; preds = %for.inc115.us.prol.preheader, %for.inc115.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc115.us.prol ], [ 0, %for.inc115.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.inc115.us.prol ], [ %xtraiter, %for.inc115.us.prol.preheader ]
  %arrayidx110.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %57, i64 0, i64 %indvars.iv47, i64 %indvars.iv.prol
  %61 = bitcast double* %arrayidx110.us.prol to i64*
  %62 = load i64, i64* %61, align 8
  %arrayidx114.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv47, i64 %indvars.iv.prol
  %63 = bitcast double* %arrayidx114.us.prol to i64*
  store i64 %62, i64* %63, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc115.us.prol.loopexit.loopexit, label %for.inc115.us.prol, !llvm.loop !3

for.inc115.us.prol.loopexit.loopexit:             ; preds = %for.inc115.us.prol
  br label %for.inc115.us.prol.loopexit

for.inc115.us.prol.loopexit:                      ; preds = %for.inc115.us.prol.loopexit.loopexit, %for.cond103.preheader.us
  %indvars.iv.unr = phi i64 [ 0, %for.cond103.preheader.us ], [ %60, %for.inc115.us.prol.loopexit.loopexit ]
  br i1 %55, label %for.inc118.us, label %for.inc115.us.preheader

for.inc115.us.preheader:                          ; preds = %for.inc115.us.prol.loopexit
  br label %for.inc115.us

for.inc115.us:                                    ; preds = %for.inc115.us.preheader, %for.inc115.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc115.us ], [ %indvars.iv.unr, %for.inc115.us.preheader ]
  %arrayidx110.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 %indvars.iv47, i64 %indvars.iv
  %64 = bitcast double* %arrayidx110.us to i64*
  %65 = load i64, i64* %64, align 8
  %arrayidx114.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv47, i64 %indvars.iv
  %66 = bitcast double* %arrayidx114.us to i64*
  store i64 %65, i64* %66, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx110.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 %indvars.iv47, i64 %indvars.iv.next
  %67 = bitcast double* %arrayidx110.us.1 to i64*
  %68 = load i64, i64* %67, align 8
  %arrayidx114.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv47, i64 %indvars.iv.next
  %69 = bitcast double* %arrayidx114.us.1 to i64*
  store i64 %68, i64* %69, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx110.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 %indvars.iv47, i64 %indvars.iv.next.1
  %70 = bitcast double* %arrayidx110.us.2 to i64*
  %71 = load i64, i64* %70, align 8
  %arrayidx114.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv47, i64 %indvars.iv.next.1
  %72 = bitcast double* %arrayidx114.us.2 to i64*
  store i64 %71, i64* %72, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx110.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 %indvars.iv47, i64 %indvars.iv.next.2
  %73 = bitcast double* %arrayidx110.us.3 to i64*
  %74 = load i64, i64* %73, align 8
  %arrayidx114.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv47, i64 %indvars.iv.next.2
  %75 = bitcast double* %arrayidx114.us.3 to i64*
  store i64 %74, i64* %75, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond45.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count44.3
  br i1 %exitcond45.3, label %for.inc118.us.loopexit, label %for.inc115.us

for.inc118.us.loopexit:                           ; preds = %for.inc115.us
  br label %for.inc118.us

for.inc118.us:                                    ; preds = %for.inc118.us.loopexit, %for.inc115.us.prol.loopexit
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next48, %wide.trip.count49
  br i1 %exitcond50, label %for.end120.loopexit, label %for.cond103.preheader.us

for.end120.loopexit:                              ; preds = %for.inc118.us
  br label %for.end120

for.end120:                                       ; preds = %for.end120.loopexit, %for.cond99.preheader, %for.cond65.preheader, %for.end46, %for.end46.thread
  %call112114120 = phi i8* [ %call110, %for.end46.thread ], [ %call, %for.end46 ], [ %call, %for.cond65.preheader ], [ %call, %for.cond99.preheader ], [ %call, %for.end120.loopexit ]
  tail call void @free(i8* %call112114120) #4
  ret void

for.inc62.us.3:                                   ; preds = %for.inc62.us.3, %for.inc62.us.3.preheader.new
  %indvars.iv69 = phi i64 [ %indvars.iv69.unr128, %for.inc62.us.3.preheader.new ], [ %indvars.iv.next70.3.1, %for.inc62.us.3 ]
  %76 = mul nuw nsw i64 %indvars.iv69, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %76
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %22, i32 8, i1 false)
  %77 = mul i64 %indvars.iv69, 16000
  %78 = add i64 %77, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %78
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %22, i32 8, i1 false)
  %79 = mul i64 %indvars.iv69, 16000
  %80 = add i64 %79, 32000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %80
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %22, i32 8, i1 false)
  %81 = mul i64 %indvars.iv69, 16000
  %82 = add i64 %81, 48000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %82
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next70.3 = add nsw i64 %indvars.iv69, 4
  %83 = mul nuw nsw i64 %indvars.iv.next70.3, 16000
  %scevgep.1129 = getelementptr i8, i8* %call, i64 %83
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1129, i8 0, i64 %22, i32 8, i1 false)
  %84 = mul i64 %indvars.iv.next70.3, 16000
  %85 = add i64 %84, 16000
  %scevgep.1.1 = getelementptr i8, i8* %call, i64 %85
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 %22, i32 8, i1 false)
  %86 = mul i64 %indvars.iv.next70.3, 16000
  %87 = add i64 %86, 32000
  %scevgep.2.1 = getelementptr i8, i8* %call, i64 %87
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 %22, i32 8, i1 false)
  %88 = mul i64 %indvars.iv.next70.3, 16000
  %89 = add i64 %88, 48000
  %scevgep.3.1 = getelementptr i8, i8* %call, i64 %89
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next70.3.1 = add nsw i64 %indvars.iv69, 8
  %exitcond72.3.1 = icmp eq i64 %indvars.iv.next70.3.1, %wide.trip.count71.3
  br i1 %exitcond72.3.1, label %for.cond65.preheader.unr-lcssa, label %for.inc62.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32 %n, [2000 x double]* nocapture %A, double* nocapture readonly %b, double* nocapture %x, double* nocapture %y) unnamed_addr #2 {
entry:
  %cmp26 = icmp sgt i32 %n, 0
  br i1 %cmp26, label %for.cond1.preheader.preheader, label %for.end113

for.cond1.preheader.preheader:                    ; preds = %entry
  %wide.trip.count89 = zext i32 %n to i64
  %wide.trip.count83 = zext i32 %n to i64
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc58, %for.cond1.preheader.preheader
  %indvars.iv87 = phi i64 [ 0, %for.cond1.preheader.preheader ], [ %indvars.iv.next88, %for.inc58 ]
  %0 = add nuw i64 %indvars.iv87, 4294967295
  %cmp218 = icmp sgt i64 %indvars.iv87, 0
  br i1 %cmp218, label %for.body3.preheader, label %for.inc58

for.body3.preheader:                              ; preds = %for.cond1.preheader
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv87, i64 0
  br label %for.body3

for.cond61.preheader:                             ; preds = %for.inc58
  %cmp6212 = icmp sgt i32 %n, 0
  br i1 %cmp6212, label %for.body63.preheader, label %for.end113

for.body63.preheader:                             ; preds = %for.cond61.preheader
  %wide.trip.count47 = zext i32 %n to i64
  br label %for.body63

for.body30.lr.ph:                                 ; preds = %for.inc25
  %cmp3620 = icmp sgt i64 %indvars.iv87, 0
  br i1 %cmp3620, label %for.body30.us.preheader, label %for.inc58

for.body30.us.preheader:                          ; preds = %for.body30.lr.ph
  %xtraiter7791 = and i64 %indvars.iv87, 1
  %1 = trunc i64 %0 to i32
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv87, i64 0
  %2 = icmp eq i64 %xtraiter7791, 0
  %3 = icmp eq i32 %1, 0
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.inc55.us, %for.body30.us.preheader
  %indvars.iv81 = phi i64 [ %indvars.iv87, %for.body30.us.preheader ], [ %indvars.iv.next82, %for.inc55.us ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv87, i64 %indvars.iv81
  %4 = load double, double* %arrayidx34.us, align 8
  br i1 %2, label %for.inc48.us.prol.loopexit, label %for.inc48.us.prol

for.inc48.us.prol:                                ; preds = %for.body30.us
  %5 = load double, double* %arrayidx41.us.prol, align 8
  %arrayidx45.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv81
  %6 = load double, double* %arrayidx45.us.prol, align 8
  %mul46.us.prol = fmul double %5, %6
  %sub47.us.prol = fsub double %4, %mul46.us.prol
  br label %for.inc48.us.prol.loopexit

for.inc48.us.prol.loopexit:                       ; preds = %for.body30.us, %for.inc48.us.prol
  %indvars.iv69.unr.ph = phi i64 [ 1, %for.inc48.us.prol ], [ 0, %for.body30.us ]
  %w.122.us.unr.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ %4, %for.body30.us ]
  %sub47.us.lcssa.unr.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ undef, %for.body30.us ]
  br i1 %3, label %for.inc55.us, label %for.inc48.us.preheader

for.inc48.us.preheader:                           ; preds = %for.inc48.us.prol.loopexit
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us.preheader, %for.inc48.us
  %indvars.iv69 = phi i64 [ %indvars.iv.next70.1, %for.inc48.us ], [ %indvars.iv69.unr.ph, %for.inc48.us.preheader ]
  %w.122.us = phi double [ %sub47.us.1, %for.inc48.us ], [ %w.122.us.unr.ph, %for.inc48.us.preheader ]
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv87, i64 %indvars.iv69
  %7 = bitcast double* %arrayidx41.us to <2 x double>*
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv69, i64 %indvars.iv81
  %8 = load double, double* %arrayidx45.us, align 8
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %9 = load <2 x double>, <2 x double>* %7, align 8
  %arrayidx45.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next70, i64 %indvars.iv81
  %10 = load double, double* %arrayidx45.us.1, align 8
  %mul46.us.v.i1.1 = insertelement <2 x double> undef, double %8, i32 0
  %mul46.us.v.i1.2 = insertelement <2 x double> %mul46.us.v.i1.1, double %10, i32 1
  %mul46.us = fmul <2 x double> %9, %mul46.us.v.i1.2
  %mul46.us.v.r1 = extractelement <2 x double> %mul46.us, i32 0
  %mul46.us.v.r2 = extractelement <2 x double> %mul46.us, i32 1
  %sub47.us = fsub double %w.122.us, %mul46.us.v.r1
  %sub47.us.1 = fsub double %sub47.us, %mul46.us.v.r2
  %indvars.iv.next70.1 = add nuw nsw i64 %indvars.iv69, 2
  %exitcond76.1 = icmp eq i64 %indvars.iv.next70.1, %indvars.iv87
  br i1 %exitcond76.1, label %for.inc55.us.loopexit, label %for.inc48.us

for.inc55.us.loopexit:                            ; preds = %for.inc48.us
  br label %for.inc55.us

for.inc55.us:                                     ; preds = %for.inc55.us.loopexit, %for.inc48.us.prol.loopexit
  %sub47.us.lcssa = phi double [ %sub47.us.lcssa.unr.ph, %for.inc48.us.prol.loopexit ], [ %sub47.us.1, %for.inc55.us.loopexit ]
  store double %sub47.us.lcssa, double* %arrayidx34.us, align 8
  %indvars.iv.next82 = add nuw nsw i64 %indvars.iv81, 1
  %exitcond84 = icmp eq i64 %indvars.iv.next82, %wide.trip.count83
  br i1 %exitcond84, label %for.inc58.loopexit, label %for.body30.us

for.body3:                                        ; preds = %for.inc25, %for.body3.preheader
  %indvars.iv61 = phi i64 [ 0, %for.body3.preheader ], [ %indvars.iv.next62, %for.inc25 ]
  %11 = add nuw i64 %indvars.iv61, 4294967295
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv87, i64 %indvars.iv61
  %12 = load double, double* %arrayidx5, align 8
  %cmp714 = icmp sgt i64 %indvars.iv61, 0
  br i1 %cmp714, label %for.inc.preheader, label %for.inc25

for.inc.preheader:                                ; preds = %for.body3
  %xtraiter5792 = and i64 %indvars.iv61, 1
  %lcmp.mod58 = icmp eq i64 %xtraiter5792, 0
  br i1 %lcmp.mod58, label %for.inc.prol.loopexit, label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.preheader
  %13 = load double, double* %arrayidx12.prol, align 8
  %arrayidx16.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv61
  %14 = load double, double* %arrayidx16.prol, align 8
  %mul.prol = fmul double %13, %14
  %sub.prol = fsub double %12, %mul.prol
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.preheader, %for.inc.prol
  %indvars.iv49.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.preheader ]
  %w.016.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ %12, %for.inc.preheader ]
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ undef, %for.inc.preheader ]
  %15 = trunc i64 %11 to i32
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %for.inc25, label %for.inc.preheader108

for.inc.preheader108:                             ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader108, %for.inc
  %indvars.iv49 = phi i64 [ %indvars.iv.next50.1, %for.inc ], [ %indvars.iv49.unr.ph, %for.inc.preheader108 ]
  %w.016 = phi double [ %sub.1, %for.inc ], [ %w.016.unr.ph, %for.inc.preheader108 ]
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv87, i64 %indvars.iv49
  %17 = bitcast double* %arrayidx12 to <2 x double>*
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv49, i64 %indvars.iv61
  %18 = load double, double* %arrayidx16, align 8
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %19 = load <2 x double>, <2 x double>* %17, align 8
  %arrayidx16.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next50, i64 %indvars.iv61
  %20 = load double, double* %arrayidx16.1, align 8
  %mul.v.i1.1 = insertelement <2 x double> undef, double %18, i32 0
  %mul.v.i1.2 = insertelement <2 x double> %mul.v.i1.1, double %20, i32 1
  %mul = fmul <2 x double> %19, %mul.v.i1.2
  %mul.v.r1 = extractelement <2 x double> %mul, i32 0
  %mul.v.r2 = extractelement <2 x double> %mul, i32 1
  %sub = fsub double %w.016, %mul.v.r1
  %sub.1 = fsub double %sub, %mul.v.r2
  %indvars.iv.next50.1 = add nuw nsw i64 %indvars.iv49, 2
  %exitcond56.1 = icmp eq i64 %indvars.iv.next50.1, %indvars.iv61
  br i1 %exitcond56.1, label %for.inc25.loopexit, label %for.inc

for.inc25.loopexit:                               ; preds = %for.inc
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.inc.prol.loopexit, %for.body3
  %w.0.lcssa = phi double [ %12, %for.body3 ], [ %sub.lcssa.unr.ph, %for.inc.prol.loopexit ], [ %sub.1, %for.inc25.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv61, i64 %indvars.iv61
  %21 = load double, double* %arrayidx20, align 8
  %div = fdiv double %w.0.lcssa, %21
  store double %div, double* %arrayidx5, align 8
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next62, %indvars.iv87
  br i1 %exitcond68, label %for.body30.lr.ph, label %for.body3

for.inc58.loopexit:                               ; preds = %for.inc55.us
  br label %for.inc58

for.inc58:                                        ; preds = %for.inc58.loopexit, %for.body30.lr.ph, %for.cond1.preheader
  %indvars.iv.next88 = add nuw nsw i64 %indvars.iv87, 1
  %exitcond90 = icmp eq i64 %indvars.iv.next88, %wide.trip.count89
  br i1 %exitcond90, label %for.cond61.preheader, label %for.cond1.preheader

for.cond86.preheader:                             ; preds = %for.inc82
  %cmp876 = icmp sgt i32 %n, 0
  br i1 %cmp876, label %for.body88.preheader, label %for.end113

for.body88.preheader:                             ; preds = %for.cond86.preheader
  %22 = sext i32 %n to i64
  %23 = sext i32 %n to i64
  %sunkaddr = ptrtoint double* %x to i64
  %24 = add i64 %22, 1
  br label %for.body88

for.body63:                                       ; preds = %for.inc82, %for.body63.preheader
  %indvars.iv112 = phi i2 [ %indvars.iv.next113, %for.inc82 ], [ 0, %for.body63.preheader ]
  %indvars.iv45 = phi i64 [ 0, %for.body63.preheader ], [ %indvars.iv.next46, %for.inc82 ]
  %25 = zext i2 %indvars.iv112 to i32
  %26 = add i32 %25, -1
  %27 = zext i32 %26 to i64
  %28 = add i64 %27, 1
  %29 = add nuw i64 %indvars.iv45, 4294967295
  %arrayidx65 = getelementptr inbounds double, double* %b, i64 %indvars.iv45
  %30 = load double, double* %arrayidx65, align 8
  %cmp678 = icmp sgt i64 %indvars.iv45, 0
  br i1 %cmp678, label %for.inc77.preheader, label %for.inc82

for.inc77.preheader:                              ; preds = %for.body63
  %31 = trunc i64 %indvars.iv45 to i32
  %xtraiter40 = and i32 %31, 3
  %lcmp.mod41 = icmp eq i32 %xtraiter40, 0
  br i1 %lcmp.mod41, label %for.inc77.prol.loopexit, label %for.inc77.prol.preheader

for.inc77.prol.preheader:                         ; preds = %for.inc77.preheader
  br label %for.inc77.prol

for.inc77.prol:                                   ; preds = %for.inc77.prol.preheader, %for.inc77.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc77.prol ], [ 0, %for.inc77.prol.preheader ]
  %w.210.prol = phi double [ %sub76.prol, %for.inc77.prol ], [ %30, %for.inc77.prol.preheader ]
  %prol.iter42 = phi i32 [ %prol.iter42.sub, %for.inc77.prol ], [ %xtraiter40, %for.inc77.prol.preheader ]
  %arrayidx72.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv45, i64 %indvars.iv.prol
  %32 = load double, double* %arrayidx72.prol, align 8
  %arrayidx74.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv.prol
  %33 = load double, double* %arrayidx74.prol, align 8
  %mul75.prol = fmul double %32, %33
  %sub76.prol = fsub double %w.210.prol, %mul75.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter42.sub = add nsw i32 %prol.iter42, -1
  %prol.iter42.cmp = icmp eq i32 %prol.iter42.sub, 0
  br i1 %prol.iter42.cmp, label %for.inc77.prol.loopexit.loopexit, label %for.inc77.prol, !llvm.loop !4

for.inc77.prol.loopexit.loopexit:                 ; preds = %for.inc77.prol
  br label %for.inc77.prol.loopexit

for.inc77.prol.loopexit:                          ; preds = %for.inc77.prol.loopexit.loopexit, %for.inc77.preheader
  %indvars.iv.unr = phi i64 [ 0, %for.inc77.preheader ], [ %28, %for.inc77.prol.loopexit.loopexit ]
  %w.210.unr = phi double [ %30, %for.inc77.preheader ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %sub76.lcssa.unr = phi double [ undef, %for.inc77.preheader ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %34 = trunc i64 %29 to i32
  %35 = icmp ult i32 %34, 3
  br i1 %35, label %for.inc82, label %for.inc77.preheader107

for.inc77.preheader107:                           ; preds = %for.inc77.prol.loopexit
  br label %for.inc77

for.inc77:                                        ; preds = %for.inc77.preheader107, %for.inc77
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc77 ], [ %indvars.iv.unr, %for.inc77.preheader107 ]
  %w.210 = phi double [ %sub76.3, %for.inc77 ], [ %w.210.unr, %for.inc77.preheader107 ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv45, i64 %indvars.iv
  %36 = bitcast double* %arrayidx72 to <2 x double>*
  %arrayidx74 = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %37 = bitcast double* %arrayidx74 to <2 x double>*
  %38 = load <2 x double>, <2 x double>* %36, align 8
  %39 = load <2 x double>, <2 x double>* %37, align 8
  %mul75 = fmul <2 x double> %38, %39
  %mul75.v.r1 = extractelement <2 x double> %mul75, i32 0
  %mul75.v.r2 = extractelement <2 x double> %mul75, i32 1
  %sub76 = fsub double %w.210, %mul75.v.r1
  %sub76.1 = fsub double %sub76, %mul75.v.r2
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx72.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv45, i64 %indvars.iv.next.1
  %40 = bitcast double* %arrayidx72.2 to <2 x double>*
  %arrayidx74.2 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next.1
  %41 = bitcast double* %arrayidx74.2 to <2 x double>*
  %42 = load <2 x double>, <2 x double>* %40, align 8
  %43 = load <2 x double>, <2 x double>* %41, align 8
  %mul75.2 = fmul <2 x double> %42, %43
  %mul75.2.v.r1 = extractelement <2 x double> %mul75.2, i32 0
  %mul75.2.v.r2 = extractelement <2 x double> %mul75.2, i32 1
  %sub76.2 = fsub double %sub76.1, %mul75.2.v.r1
  %sub76.3 = fsub double %sub76.2, %mul75.2.v.r2
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond39.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv45
  br i1 %exitcond39.3, label %for.inc82.loopexit, label %for.inc77

for.inc82.loopexit:                               ; preds = %for.inc77
  br label %for.inc82

for.inc82:                                        ; preds = %for.inc82.loopexit, %for.inc77.prol.loopexit, %for.body63
  %w.2.lcssa = phi double [ %30, %for.body63 ], [ %sub76.lcssa.unr, %for.inc77.prol.loopexit ], [ %sub76.3, %for.inc82.loopexit ]
  %arrayidx81 = getelementptr inbounds double, double* %y, i64 %indvars.iv45
  store double %w.2.lcssa, double* %arrayidx81, align 8
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next46, %wide.trip.count47
  %indvars.iv.next113 = add i2 %indvars.iv112, 1
  br i1 %exitcond48, label %for.cond86.preheader, label %for.body63

for.body88:                                       ; preds = %for.inc112.for.body88_crit_edge, %for.body88.preheader
  %indvars.iv110 = phi i2 [ %indvars.iv.next111, %for.inc112.for.body88_crit_edge ], [ 0, %for.body88.preheader ]
  %indvars.iv109 = phi i64 [ %indvars.iv.next, %for.inc112.for.body88_crit_edge ], [ %24, %for.body88.preheader ]
  %indvars.iv32 = phi i64 [ %22, %for.body88.preheader ], [ %indvars.iv.next33, %for.inc112.for.body88_crit_edge ]
  %indvar = phi i32 [ 0, %for.body88.preheader ], [ %indvar.next, %for.inc112.for.body88_crit_edge ]
  %44 = zext i2 %indvars.iv110 to i32
  %45 = add i32 %44, -1
  %46 = zext i32 %45 to i64
  %47 = add i64 %indvars.iv109, %46
  %48 = add nsw i32 %indvar, -1
  %indvars.iv.next33 = add nsw i64 %indvars.iv32, -1
  %arrayidx90 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next33
  %49 = load double, double* %arrayidx90, align 8
  %cmp922 = icmp slt i64 %indvars.iv32, %23
  br i1 %cmp922, label %for.inc102.preheader, label %for.inc112

for.inc102.preheader:                             ; preds = %for.body88
  %xtraiter = and i32 %indvar, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc102.prol.loopexit, label %for.inc102.prol.preheader

for.inc102.prol.preheader:                        ; preds = %for.inc102.preheader
  br label %for.inc102.prol

for.inc102.prol:                                  ; preds = %for.inc102.prol.preheader, %for.inc102.prol
  %indvars.iv30.prol = phi i64 [ %indvars.iv.next31.prol, %for.inc102.prol ], [ %indvars.iv32, %for.inc102.prol.preheader ]
  %w.33.prol = phi double [ %sub101.prol, %for.inc102.prol ], [ %49, %for.inc102.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.inc102.prol ], [ %xtraiter, %for.inc102.prol.preheader ]
  %arrayidx97.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next33, i64 %indvars.iv30.prol
  %50 = load double, double* %arrayidx97.prol, align 8
  %arrayidx99.prol = getelementptr inbounds double, double* %x, i64 %indvars.iv30.prol
  %51 = load double, double* %arrayidx99.prol, align 8
  %mul100.prol = fmul double %50, %51
  %sub101.prol = fsub double %w.33.prol, %mul100.prol
  %indvars.iv.next31.prol = add nsw i64 %indvars.iv30.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc102.prol.loopexit.loopexit, label %for.inc102.prol, !llvm.loop !5

for.inc102.prol.loopexit.loopexit:                ; preds = %for.inc102.prol
  br label %for.inc102.prol.loopexit

for.inc102.prol.loopexit:                         ; preds = %for.inc102.prol.loopexit.loopexit, %for.inc102.preheader
  %indvars.iv30.unr = phi i64 [ %indvars.iv32, %for.inc102.preheader ], [ %47, %for.inc102.prol.loopexit.loopexit ]
  %w.33.unr = phi double [ %49, %for.inc102.preheader ], [ %sub101.prol, %for.inc102.prol.loopexit.loopexit ]
  %sub101.lcssa.unr = phi double [ undef, %for.inc102.preheader ], [ %sub101.prol, %for.inc102.prol.loopexit.loopexit ]
  %52 = icmp ult i32 %48, 3
  br i1 %52, label %for.inc112, label %for.inc102.preheader106

for.inc102.preheader106:                          ; preds = %for.inc102.prol.loopexit
  br label %for.inc102

for.inc102:                                       ; preds = %for.inc102.preheader106, %for.inc102
  %indvars.iv30 = phi i64 [ %indvars.iv.next31.3, %for.inc102 ], [ %indvars.iv30.unr, %for.inc102.preheader106 ]
  %w.33 = phi double [ %sub101.3, %for.inc102 ], [ %w.33.unr, %for.inc102.preheader106 ]
  %arrayidx97 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next33, i64 %indvars.iv30
  %53 = bitcast double* %arrayidx97 to <2 x double>*
  %arrayidx99 = getelementptr inbounds double, double* %x, i64 %indvars.iv30
  %54 = bitcast double* %arrayidx99 to <2 x double>*
  %55 = load <2 x double>, <2 x double>* %53, align 8
  %56 = load <2 x double>, <2 x double>* %54, align 8
  %mul100 = fmul <2 x double> %55, %56
  %mul100.v.r1 = extractelement <2 x double> %mul100, i32 0
  %mul100.v.r2 = extractelement <2 x double> %mul100, i32 1
  %sub101 = fsub double %w.33, %mul100.v.r1
  %sub101.1 = fsub double %sub101, %mul100.v.r2
  %indvars.iv.next31.1 = add nsw i64 %indvars.iv30, 2
  %arrayidx97.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next33, i64 %indvars.iv.next31.1
  %57 = bitcast double* %arrayidx97.2 to <2 x double>*
  %arrayidx99.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next31.1
  %58 = bitcast double* %arrayidx99.2 to <2 x double>*
  %59 = load <2 x double>, <2 x double>* %57, align 8
  %60 = load <2 x double>, <2 x double>* %58, align 8
  %mul100.2 = fmul <2 x double> %59, %60
  %mul100.2.v.r1 = extractelement <2 x double> %mul100.2, i32 0
  %mul100.2.v.r2 = extractelement <2 x double> %mul100.2, i32 1
  %sub101.2 = fsub double %sub101.1, %mul100.2.v.r1
  %sub101.3 = fsub double %sub101.2, %mul100.2.v.r2
  %indvars.iv.next31.3 = add nsw i64 %indvars.iv30, 4
  %lftr.wideiv.3 = trunc i64 %indvars.iv.next31.3 to i32
  %exitcond.3 = icmp eq i32 %lftr.wideiv.3, %n
  br i1 %exitcond.3, label %for.inc112.loopexit, label %for.inc102

for.inc112.loopexit:                              ; preds = %for.inc102
  br label %for.inc112

for.inc112:                                       ; preds = %for.inc112.loopexit, %for.inc102.prol.loopexit, %for.body88
  %w.3.lcssa = phi double [ %49, %for.body88 ], [ %sub101.lcssa.unr, %for.inc102.prol.loopexit ], [ %sub101.3, %for.inc112.loopexit ]
  %arrayidx108 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next33, i64 %indvars.iv.next33
  %61 = load double, double* %arrayidx108, align 8
  %div109 = fdiv double %w.3.lcssa, %61
  %sunkaddr102 = shl i64 %indvars.iv32, 3
  %sunkaddr103 = add i64 %sunkaddr, %sunkaddr102
  %sunkaddr104 = add i64 %sunkaddr103, -8
  %sunkaddr105 = inttoptr i64 %sunkaddr104 to double*
  store double %div109, double* %sunkaddr105, align 8
  %cmp87 = icmp sgt i64 %indvars.iv32, 1
  br i1 %cmp87, label %for.inc112.for.body88_crit_edge, label %for.end113.loopexit

for.inc112.for.body88_crit_edge:                  ; preds = %for.inc112
  %indvar.next = add nuw nsw i32 %indvar, 1
  %indvars.iv.next = add i64 %indvars.iv109, -1
  %indvars.iv.next111 = add i2 %indvars.iv110, 1
  br label %for.body88

for.end113.loopexit:                              ; preds = %for.inc112
  br label %for.end113

for.end113:                                       ; preds = %for.end113.loopexit, %for.cond86.preheader, %for.cond61.preheader, %entry
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* nocapture readonly %x) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp1 = icmp sgt i32 %n, 0
  br i1 %cmp1, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %wide.trip.count3 = zext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %for.inc, %for.body.preheader
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %for.inc ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #6
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next, %wide.trip.count3
  br i1 %exitcond4, label %for.end.loopexit, label %for.body

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
!4 = distinct !{!4, !2}
!5 = distinct !{!5, !2}
