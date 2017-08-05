; ModuleID = 'A.ll'
source_filename = "lu.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %arraydecay = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_lu(i32 2000, [2000 x double]* %arraydecay)
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
  %1 = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* %A) unnamed_addr #0 {
entry:
  %0 = sext i32 %n to i64
  %cmp129 = icmp sgt i32 %n, 0
  br i1 %cmp129, label %for.cond1.preheader.lr.ph, label %for.end25.thread

for.end25.thread:                                 ; preds = %entry
  %call142 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %for.end99

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %1 = add i32 %n, -1
  %conv4 = sitofp i32 %n to double
  %wide.trip.count81 = zext i32 %1 to i64
  %2 = shl nuw nsw i64 %wide.trip.count81, 3
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc23, %for.cond1.preheader.lr.ph
  %indvars.iv83131 = phi i64 [ 1, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next84, %for.inc23 ]
  %indvars.iv85130 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next80126, %for.inc23 ]
  %3 = mul nuw nsw i64 %indvars.iv85130, 2001
  %4 = add nuw nsw i64 %3, 1
  %scevgep139 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %4
  br label %for.inc

for.cond8.preheader:                              ; preds = %for.inc
  %indvars.iv.next80126 = add nuw nsw i64 %indvars.iv85130, 1
  %exitcond82127 = icmp eq i64 %indvars.iv85130, %wide.trip.count81
  br i1 %exitcond82127, label %for.inc23, label %for.inc23.loopexit

for.inc:                                          ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv70125 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next71, %for.inc ]
  %5 = sub nsw i64 0, %indvars.iv70125
  %6 = trunc i64 %5 to i32
  %rem = srem i32 %6, %n
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, %conv4
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv85130, i64 %indvars.iv70125
  store double %add, double* %arrayidx6, align 8
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70125, 1
  %exitcond76 = icmp eq i64 %indvars.iv.next71, %indvars.iv83131
  br i1 %exitcond76, label %for.cond8.preheader, label %for.inc

for.inc23.loopexit:                               ; preds = %for.cond8.preheader
  %7 = mul nsw i64 %indvars.iv85130, -8
  %8 = add nsw i64 %2, %7
  %scevgep139140 = bitcast double* %scevgep139 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep139140, i8 0, i64 %8, i32 8, i1 false)
  br label %for.inc23

for.inc23:                                        ; preds = %for.cond8.preheader, %for.inc23.loopexit
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv85130, i64 %indvars.iv85130
  store double 1.000000e+00, double* %arrayidx22, align 8
  %exitcond141 = icmp eq i64 %indvars.iv.next80126, %0
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83131, 1
  br i1 %exitcond141, label %for.end25, label %for.cond1.preheader

for.end25:                                        ; preds = %for.inc23
  %9 = icmp sgt i32 %n, 0
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br i1 %9, label %for.cond30.preheader.preheader, label %for.end99

for.cond30.preheader.preheader:                   ; preds = %for.end25
  %wide.trip.count66 = zext i32 %n to i64
  %10 = shl nuw nsw i64 %wide.trip.count66, 3
  %11 = add nsw i64 %0, -1
  %xtraiter195 = and i64 %0, 7
  %lcmp.mod196 = icmp eq i64 %xtraiter195, 0
  br i1 %lcmp.mod196, label %for.inc41.prol.loopexit, label %for.inc41.prol.preheader

for.inc41.prol.preheader:                         ; preds = %for.cond30.preheader.preheader
  br label %for.inc41.prol

for.inc41.prol:                                   ; preds = %for.inc41.prol, %for.inc41.prol.preheader
  %indvars.iv68123.prol = phi i64 [ 0, %for.inc41.prol.preheader ], [ %indvars.iv.next69.prol, %for.inc41.prol ]
  %prol.iter197 = phi i64 [ %xtraiter195, %for.inc41.prol.preheader ], [ %prol.iter197.sub, %for.inc41.prol ]
  %12 = mul nuw nsw i64 %indvars.iv68123.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %call, i64 %12
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %10, i32 8, i1 false)
  %indvars.iv.next69.prol = add nuw nsw i64 %indvars.iv68123.prol, 1
  %prol.iter197.sub = add i64 %prol.iter197, -1
  %prol.iter197.cmp = icmp eq i64 %prol.iter197.sub, 0
  br i1 %prol.iter197.cmp, label %for.inc41.prol.loopexit.unr-lcssa, label %for.inc41.prol, !llvm.loop !1

for.inc41.prol.loopexit.unr-lcssa:                ; preds = %for.inc41.prol
  br label %for.inc41.prol.loopexit

for.inc41.prol.loopexit:                          ; preds = %for.cond30.preheader.preheader, %for.inc41.prol.loopexit.unr-lcssa
  %indvars.iv68123.unr = phi i64 [ 0, %for.cond30.preheader.preheader ], [ %indvars.iv.next69.prol, %for.inc41.prol.loopexit.unr-lcssa ]
  %13 = icmp ult i64 %11, 7
  br i1 %13, label %for.cond44.preheader, label %for.cond30.preheader.preheader.new

for.cond30.preheader.preheader.new:               ; preds = %for.inc41.prol.loopexit
  br label %for.inc41

for.cond44.preheader.unr-lcssa:                   ; preds = %for.inc41
  br label %for.cond44.preheader

for.cond44.preheader:                             ; preds = %for.inc41.prol.loopexit, %for.cond44.preheader.unr-lcssa
  %14 = icmp sgt i32 %n, 0
  br i1 %14, label %for.cond48.preheader.preheader, label %for.end99

for.cond48.preheader.preheader:                   ; preds = %for.cond44.preheader
  %wide.trip.count60 = zext i32 %n to i64
  %15 = shl nuw nsw i64 %wide.trip.count60, 3
  %16 = add nsw i64 %wide.trip.count60, -1
  %min.iters.check = icmp ult i32 %n, 4
  %17 = bitcast i8* %call to [2000 x [2000 x double]]*
  %18 = bitcast i8* %call to [2000 x [2000 x double]]*
  %19 = bitcast i8* %call to [2000 x [2000 x double]]*
  %20 = and i32 %n, 3
  %n.mod.vf = zext i32 %20 to i64
  %n.vec = sub nsw i64 %wide.trip.count60, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %21 = bitcast i8* %call to [2000 x [2000 x double]]*
  %cmp.n = icmp eq i32 %20, 0
  br label %for.cond52.preheader.preheader

for.inc41:                                        ; preds = %for.inc41, %for.cond30.preheader.preheader.new
  %indvars.iv68123 = phi i64 [ %indvars.iv68123.unr, %for.cond30.preheader.preheader.new ], [ %indvars.iv.next69.7, %for.inc41 ]
  %22 = mul nuw nsw i64 %indvars.iv68123, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %10, i32 8, i1 false)
  %23 = mul i64 %indvars.iv68123, 16000
  %24 = add i64 %23, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %10, i32 8, i1 false)
  %25 = mul i64 %indvars.iv68123, 16000
  %26 = add i64 %25, 32000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %26
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %10, i32 8, i1 false)
  %27 = mul i64 %indvars.iv68123, 16000
  %28 = add i64 %27, 48000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %28
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %10, i32 8, i1 false)
  %29 = mul i64 %indvars.iv68123, 16000
  %30 = add i64 %29, 64000
  %scevgep.4 = getelementptr i8, i8* %call, i64 %30
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 %10, i32 8, i1 false)
  %31 = mul i64 %indvars.iv68123, 16000
  %32 = add i64 %31, 80000
  %scevgep.5 = getelementptr i8, i8* %call, i64 %32
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 %10, i32 8, i1 false)
  %33 = mul i64 %indvars.iv68123, 16000
  %34 = add i64 %33, 96000
  %scevgep.6 = getelementptr i8, i8* %call, i64 %34
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 %10, i32 8, i1 false)
  %35 = mul i64 %indvars.iv68123, 16000
  %36 = add i64 %35, 112000
  %scevgep.7 = getelementptr i8, i8* %call, i64 %36
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 %10, i32 8, i1 false)
  %indvars.iv.next69.7 = add nsw i64 %indvars.iv68123, 8
  %exitcond138.7 = icmp eq i64 %indvars.iv.next69.7, %0
  br i1 %exitcond138.7, label %for.cond44.preheader.unr-lcssa, label %for.inc41

for.cond52.preheader.preheader:                   ; preds = %for.inc75, %for.cond48.preheader.preheader
  %indvars.iv6298 = phi i64 [ 0, %for.cond48.preheader.preheader ], [ %indvars.iv.next63, %for.inc75 ]
  %scevgep152 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv6298
  %scevgep152153 = bitcast double* %scevgep152 to i8*
  %37 = add i64 %indvars.iv6298, -1999
  %scevgep154 = getelementptr [2000 x double], [2000 x double]* %A, i64 %wide.trip.count60, i64 %37
  %scevgep154155 = bitcast double* %scevgep154 to i8*
  br label %for.cond52.preheader

for.cond78.preheader:                             ; preds = %for.inc75
  %38 = icmp sgt i32 %n, 0
  br i1 %38, label %for.cond82.preheader.preheader, label %for.end99

for.cond82.preheader.preheader:                   ; preds = %for.cond78.preheader
  %wide.trip.count = zext i32 %n to i64
  %39 = shl nuw nsw i64 %wide.trip.count60, 3
  %40 = add nsw i64 %wide.trip.count60, -1
  %min.iters.check165 = icmp ult i32 %n, 4
  %41 = bitcast i8* %call to [2000 x [2000 x double]]*
  %42 = bitcast i8* %call to [2000 x [2000 x double]]*
  %43 = bitcast i8* %call to [2000 x [2000 x double]]*
  %44 = bitcast i8* %call to [2000 x [2000 x double]]*
  %45 = bitcast i8* %call to [2000 x [2000 x double]]*
  %46 = and i32 %n, 3
  %n.mod.vf167 = zext i32 %46 to i64
  %n.vec168 = sub nsw i64 %wide.trip.count60, %n.mod.vf167
  %cmp.zero169 = icmp eq i64 %n.vec168, 0
  %47 = bitcast i8* %call to [2000 x [2000 x double]]*
  %cmp.n186 = icmp eq i32 %46, 0
  br label %for.cond82.preheader

for.cond52.preheader:                             ; preds = %for.inc72, %for.cond52.preheader.preheader
  %indvars.iv5895 = phi i64 [ 0, %for.cond52.preheader.preheader ], [ %indvars.iv.next59, %for.inc72 ]
  %48 = mul i64 %indvars.iv5895, 16000
  %scevgep150 = getelementptr i8, i8* %call, i64 %48
  %49 = add i64 %15, %48
  %scevgep151 = getelementptr i8, i8* %call, i64 %49
  %arrayidx59 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv5895, i64 %indvars.iv6298
  br i1 %min.iters.check, label %for.inc69.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond52.preheader
  br i1 %cmp.zero, label %for.inc69.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult i8* %scevgep150, %scevgep154155
  %bound1 = icmp ult i8* %scevgep152153, %scevgep151
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %arrayidx59 to i8*
  %bc156 = bitcast double* %arrayidx59 to i8*
  %bound0157 = icmp ult i8* %scevgep150, %bc156
  %bound1158 = icmp ult i8* %bc, %scevgep151
  %found.conflict159 = and i1 %bound0157, %bound1158
  %conflict.rdx = or i1 %found.conflict, %found.conflict159
  br i1 %conflict.rdx, label %for.inc69.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %50 = or i64 %index, 1
  %51 = or i64 %index, 2
  %52 = or i64 %index, 3
  %53 = load double, double* %arrayidx59, align 8, !alias.scope !3
  %54 = insertelement <2 x double> undef, double %53, i32 0
  %55 = shufflevector <2 x double> %54, <2 x double> undef, <2 x i32> zeroinitializer
  %56 = insertelement <2 x double> undef, double %53, i32 0
  %57 = shufflevector <2 x double> %56, <2 x double> undef, <2 x i32> zeroinitializer
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %index, i64 %indvars.iv6298
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %50, i64 %indvars.iv6298
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %51, i64 %indvars.iv6298
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %52, i64 %indvars.iv6298
  %62 = load double, double* %58, align 8, !alias.scope !6
  %63 = load double, double* %59, align 8, !alias.scope !6
  %64 = load double, double* %60, align 8, !alias.scope !6
  %65 = load double, double* %61, align 8, !alias.scope !6
  %66 = insertelement <2 x double> undef, double %62, i32 0
  %67 = insertelement <2 x double> %66, double %63, i32 1
  %68 = insertelement <2 x double> undef, double %64, i32 0
  %69 = insertelement <2 x double> %68, double %65, i32 1
  %70 = fmul <2 x double> %55, %67
  %71 = fmul <2 x double> %57, %69
  %72 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv5895, i64 %index
  %73 = bitcast double* %72 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %73, align 8, !alias.scope !8, !noalias !10
  %74 = getelementptr double, double* %72, i64 2
  %75 = bitcast double* %74 to <2 x double>*
  %wide.load161 = load <2 x double>, <2 x double>* %75, align 8, !alias.scope !8, !noalias !10
  %76 = fadd <2 x double> %wide.load, %70
  %77 = fadd <2 x double> %wide.load161, %71
  %78 = bitcast double* %72 to <2 x double>*
  store <2 x double> %76, <2 x double>* %78, align 8, !alias.scope !8, !noalias !10
  %79 = bitcast double* %74 to <2 x double>*
  store <2 x double> %77, <2 x double>* %79, align 8, !alias.scope !8, !noalias !10
  %index.next = add i64 %index, 4
  %80 = icmp eq i64 %index.next, %n.vec
  br i1 %80, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.inc72, label %for.inc69.preheader

for.inc69.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond52.preheader
  %indvars.iv5493.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.cond52.preheader ], [ %n.vec, %middle.block ]
  %81 = sub nsw i64 %wide.trip.count60, %indvars.iv5493.ph
  %xtraiter193 = and i64 %81, 1
  %lcmp.mod194 = icmp eq i64 %xtraiter193, 0
  br i1 %lcmp.mod194, label %for.inc69.prol.loopexit.unr-lcssa, label %for.inc69.prol.preheader

for.inc69.prol.preheader:                         ; preds = %for.inc69.preheader
  br label %for.inc69.prol

for.inc69.prol:                                   ; preds = %for.inc69.prol.preheader
  %82 = load double, double* %arrayidx59, align 8
  %arrayidx63.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv5493.ph, i64 %indvars.iv6298
  %83 = load double, double* %arrayidx63.prol, align 8
  %mul.prol = fmul double %82, %83
  %arrayidx67.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv5895, i64 %indvars.iv5493.ph
  %84 = load double, double* %arrayidx67.prol, align 8
  %add68.prol = fadd double %84, %mul.prol
  store double %add68.prol, double* %arrayidx67.prol, align 8
  %indvars.iv.next55.prol = add nuw nsw i64 %indvars.iv5493.ph, 1
  br label %for.inc69.prol.loopexit.unr-lcssa

for.inc69.prol.loopexit.unr-lcssa:                ; preds = %for.inc69.preheader, %for.inc69.prol
  %indvars.iv5493.unr.ph = phi i64 [ %indvars.iv.next55.prol, %for.inc69.prol ], [ %indvars.iv5493.ph, %for.inc69.preheader ]
  br label %for.inc69.prol.loopexit

for.inc69.prol.loopexit:                          ; preds = %for.inc69.prol.loopexit.unr-lcssa
  %85 = icmp eq i64 %16, %indvars.iv5493.ph
  br i1 %85, label %for.inc72.loopexit, label %for.inc69.preheader.new

for.inc69.preheader.new:                          ; preds = %for.inc69.prol.loopexit
  br label %for.inc69

for.inc69:                                        ; preds = %for.inc69, %for.inc69.preheader.new
  %indvars.iv5493 = phi i64 [ %indvars.iv5493.unr.ph, %for.inc69.preheader.new ], [ %indvars.iv.next55.1, %for.inc69 ]
  %86 = load double, double* %arrayidx59, align 8
  %arrayidx63 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv5493, i64 %indvars.iv6298
  %87 = load double, double* %arrayidx63, align 8
  %mul = fmul double %86, %87
  %arrayidx67 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv5895, i64 %indvars.iv5493
  %88 = load double, double* %arrayidx67, align 8
  %add68 = fadd double %88, %mul
  store double %add68, double* %arrayidx67, align 8
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv5493, 1
  %89 = load double, double* %arrayidx59, align 8
  %arrayidx63.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next55, i64 %indvars.iv6298
  %90 = load double, double* %arrayidx63.1, align 8
  %mul.1 = fmul double %89, %90
  %arrayidx67.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv5895, i64 %indvars.iv.next55
  %91 = load double, double* %arrayidx67.1, align 8
  %add68.1 = fadd double %91, %mul.1
  store double %add68.1, double* %arrayidx67.1, align 8
  %indvars.iv.next55.1 = add nsw i64 %indvars.iv5493, 2
  %exitcond57.1 = icmp eq i64 %indvars.iv.next55.1, %wide.trip.count60
  br i1 %exitcond57.1, label %for.inc72.loopexit.unr-lcssa, label %for.inc69, !llvm.loop !14

for.inc72.loopexit.unr-lcssa:                     ; preds = %for.inc69
  br label %for.inc72.loopexit

for.inc72.loopexit:                               ; preds = %for.inc69.prol.loopexit, %for.inc72.loopexit.unr-lcssa
  br label %for.inc72

for.inc72:                                        ; preds = %for.inc72.loopexit, %middle.block
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv5895, 1
  %exitcond61 = icmp eq i64 %indvars.iv.next59, %wide.trip.count60
  br i1 %exitcond61, label %for.inc75, label %for.cond52.preheader

for.inc75:                                        ; preds = %for.inc72
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv6298, 1
  %exitcond137 = icmp eq i64 %indvars.iv.next63, %0
  br i1 %exitcond137, label %for.cond78.preheader, label %for.cond52.preheader.preheader

for.cond82.preheader:                             ; preds = %for.inc97, %for.cond82.preheader.preheader
  %indvars.iv5290 = phi i64 [ 0, %for.cond82.preheader.preheader ], [ %indvars.iv.next53, %for.inc97 ]
  %scevgep171 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv5290, i64 0
  %scevgep171172 = bitcast double* %scevgep171 to i8*
  %scevgep173 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv5290, i64 %wide.trip.count60
  %scevgep173174 = bitcast double* %scevgep173 to i8*
  %92 = mul i64 %indvars.iv5290, 16000
  %scevgep175 = getelementptr i8, i8* %call, i64 %92
  %93 = add i64 %39, %92
  %scevgep176 = getelementptr i8, i8* %call, i64 %93
  br i1 %min.iters.check165, label %for.inc94.preheader, label %min.iters.checked166

min.iters.checked166:                             ; preds = %for.cond82.preheader
  br i1 %cmp.zero169, label %for.inc94.preheader, label %vector.memcheck181

vector.memcheck181:                               ; preds = %min.iters.checked166
  %bound0177 = icmp ult i8* %scevgep171172, %scevgep176
  %bound1178 = icmp ult i8* %scevgep175, %scevgep173174
  %memcheck.conflict180 = and i1 %bound0177, %bound1178
  br i1 %memcheck.conflict180, label %for.inc94.preheader, label %vector.body162.preheader

vector.body162.preheader:                         ; preds = %vector.memcheck181
  br label %vector.body162

vector.body162:                                   ; preds = %vector.body162.preheader, %vector.body162
  %index183 = phi i64 [ %index.next184, %vector.body162 ], [ 0, %vector.body162.preheader ]
  %94 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv5290, i64 %index183
  %95 = bitcast double* %94 to <2 x i64>*
  %wide.load191 = load <2 x i64>, <2 x i64>* %95, align 8, !alias.scope !15
  %96 = getelementptr double, double* %94, i64 2
  %97 = bitcast double* %96 to <2 x i64>*
  %wide.load192 = load <2 x i64>, <2 x i64>* %97, align 8, !alias.scope !15
  %98 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv5290, i64 %index183
  %99 = bitcast double* %98 to <2 x i64>*
  store <2 x i64> %wide.load191, <2 x i64>* %99, align 8, !alias.scope !18, !noalias !15
  %100 = getelementptr double, double* %98, i64 2
  %101 = bitcast double* %100 to <2 x i64>*
  store <2 x i64> %wide.load192, <2 x i64>* %101, align 8, !alias.scope !18, !noalias !15
  %index.next184 = add i64 %index183, 4
  %102 = icmp eq i64 %index.next184, %n.vec168
  br i1 %102, label %middle.block163, label %vector.body162, !llvm.loop !20

middle.block163:                                  ; preds = %vector.body162
  br i1 %cmp.n186, label %for.inc97, label %for.inc94.preheader

for.inc94.preheader:                              ; preds = %middle.block163, %vector.memcheck181, %min.iters.checked166, %for.cond82.preheader
  %indvars.iv88.ph = phi i64 [ 0, %vector.memcheck181 ], [ 0, %min.iters.checked166 ], [ 0, %for.cond82.preheader ], [ %n.vec168, %middle.block163 ]
  %103 = sub nsw i64 %wide.trip.count60, %indvars.iv88.ph
  %104 = sub nsw i64 %40, %indvars.iv88.ph
  %xtraiter = and i64 %103, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc94.prol.loopexit, label %for.inc94.prol.preheader

for.inc94.prol.preheader:                         ; preds = %for.inc94.preheader
  br label %for.inc94.prol

for.inc94.prol:                                   ; preds = %for.inc94.prol, %for.inc94.prol.preheader
  %indvars.iv88.prol = phi i64 [ %indvars.iv.next.prol, %for.inc94.prol ], [ %indvars.iv88.ph, %for.inc94.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc94.prol ], [ %xtraiter, %for.inc94.prol.preheader ]
  %arrayidx89.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %45, i64 0, i64 %indvars.iv5290, i64 %indvars.iv88.prol
  %105 = bitcast double* %arrayidx89.prol to i64*
  %106 = load i64, i64* %105, align 8
  %arrayidx93.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv5290, i64 %indvars.iv88.prol
  %107 = bitcast double* %arrayidx93.prol to i64*
  store i64 %106, i64* %107, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv88.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc94.prol.loopexit.unr-lcssa, label %for.inc94.prol, !llvm.loop !21

for.inc94.prol.loopexit.unr-lcssa:                ; preds = %for.inc94.prol
  br label %for.inc94.prol.loopexit

for.inc94.prol.loopexit:                          ; preds = %for.inc94.preheader, %for.inc94.prol.loopexit.unr-lcssa
  %indvars.iv88.unr = phi i64 [ %indvars.iv88.ph, %for.inc94.preheader ], [ %indvars.iv.next.prol, %for.inc94.prol.loopexit.unr-lcssa ]
  %108 = icmp ult i64 %104, 3
  br i1 %108, label %for.inc97.loopexit, label %for.inc94.preheader.new

for.inc94.preheader.new:                          ; preds = %for.inc94.prol.loopexit
  br label %for.inc94

for.inc94:                                        ; preds = %for.inc94, %for.inc94.preheader.new
  %indvars.iv88 = phi i64 [ %indvars.iv88.unr, %for.inc94.preheader.new ], [ %indvars.iv.next.3, %for.inc94 ]
  %arrayidx89 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %indvars.iv5290, i64 %indvars.iv88
  %109 = bitcast double* %arrayidx89 to i64*
  %110 = load i64, i64* %109, align 8
  %arrayidx93 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv5290, i64 %indvars.iv88
  %111 = bitcast double* %arrayidx93 to i64*
  store i64 %110, i64* %111, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv88, 1
  %arrayidx89.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %42, i64 0, i64 %indvars.iv5290, i64 %indvars.iv.next
  %112 = bitcast double* %arrayidx89.1 to i64*
  %113 = load i64, i64* %112, align 8
  %arrayidx93.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv5290, i64 %indvars.iv.next
  %114 = bitcast double* %arrayidx93.1 to i64*
  store i64 %113, i64* %114, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv88, 2
  %arrayidx89.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %43, i64 0, i64 %indvars.iv5290, i64 %indvars.iv.next.1
  %115 = bitcast double* %arrayidx89.2 to i64*
  %116 = load i64, i64* %115, align 8
  %arrayidx93.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv5290, i64 %indvars.iv.next.1
  %117 = bitcast double* %arrayidx93.2 to i64*
  store i64 %116, i64* %117, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv88, 3
  %arrayidx89.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %44, i64 0, i64 %indvars.iv5290, i64 %indvars.iv.next.2
  %118 = bitcast double* %arrayidx89.3 to i64*
  %119 = load i64, i64* %118, align 8
  %arrayidx93.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv5290, i64 %indvars.iv.next.2
  %120 = bitcast double* %arrayidx93.3 to i64*
  store i64 %119, i64* %120, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv88, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count
  br i1 %exitcond.3, label %for.inc97.loopexit.unr-lcssa, label %for.inc94, !llvm.loop !22

for.inc97.loopexit.unr-lcssa:                     ; preds = %for.inc94
  br label %for.inc97.loopexit

for.inc97.loopexit:                               ; preds = %for.inc94.prol.loopexit, %for.inc97.loopexit.unr-lcssa
  br label %for.inc97

for.inc97:                                        ; preds = %for.inc97.loopexit, %middle.block163
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv5290, 1
  %exitcond136 = icmp eq i64 %indvars.iv.next53, %0
  br i1 %exitcond136, label %for.end99.loopexit, label %for.cond82.preheader

for.end99.loopexit:                               ; preds = %for.inc97
  br label %for.end99

for.end99:                                        ; preds = %for.end99.loopexit, %for.end25.thread, %for.end25, %for.cond44.preheader, %for.cond78.preheader
  %call143145148 = phi i8* [ %call, %for.cond78.preheader ], [ %call, %for.cond44.preheader ], [ %call, %for.end25 ], [ %call142, %for.end25.thread ], [ %call, %for.end99.loopexit ]
  tail call void @free(i8* %call143145148) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_lu(i32 %n, [2000 x double]* %A) unnamed_addr #0 {
entry:
  %0 = sext i32 %n to i64
  %cmp61 = icmp sgt i32 %n, 0
  br i1 %cmp61, label %for.cond1.preheader.lr.ph, label %for.end56

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %wide.trip.count48 = zext i32 %n to i64
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc54, %for.cond1.preheader.lr.ph
  %indvars.iv5062 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next51, %for.inc54 ]
  %exitcond3854 = icmp eq i64 %indvars.iv5062, 0
  br i1 %exitcond3854, label %for.cond28.preheader, label %for.cond4.preheader.preheader

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  %arrayidx24.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv5062, i64 0
  %.pre67 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv5062, i64 0
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv5062, i64 0
  br label %for.cond4.preheader

for.cond28.preheader.loopexit:                    ; preds = %for.inc25
  br label %for.cond28.preheader

for.cond28.preheader:                             ; preds = %for.cond28.preheader.loopexit, %for.cond1.preheader
  %exitcond4958 = icmp eq i64 %indvars.iv5062, %wide.trip.count48
  br i1 %exitcond4958, label %for.inc54, label %for.cond31.preheader.lr.ph

for.cond31.preheader.lr.ph:                       ; preds = %for.cond28.preheader
  %1 = icmp eq i64 %indvars.iv5062, 0
  br i1 %1, label %for.inc54, label %for.cond31.preheader.preheader

for.cond31.preheader.preheader:                   ; preds = %for.cond31.preheader.lr.ph
  %xtraiter69 = and i64 %indvars.iv5062, 1
  %lcmp.mod70 = icmp eq i64 %xtraiter69, 0
  %2 = icmp eq i64 %indvars.iv5062, 1
  %arrayidx37.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv5062, i64 0
  br label %for.cond31.preheader

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.inc25
  %indvars.iv3355 = phi i64 [ %indvars.iv.next34, %for.inc25 ], [ 0, %for.cond4.preheader.preheader ]
  %exitcond52 = icmp eq i64 %indvars.iv3355, 0
  br i1 %exitcond52, label %for.cond4.preheader.for.inc25_crit_edge, label %for.inc.lr.ph

for.cond4.preheader.for.inc25_crit_edge:          ; preds = %for.cond4.preheader
  %.pre65 = load double, double* %arrayidx24.phi.trans.insert, align 8
  br label %for.inc25

for.inc.lr.ph:                                    ; preds = %for.cond4.preheader
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv5062, i64 %indvars.iv3355
  %.pre = load double, double* %arrayidx16, align 8
  %xtraiter = and i64 %indvars.iv3355, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.prol.loopexit.unr-lcssa, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.lr.ph
  br label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.prol.preheader
  %3 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv3355
  %4 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %3, %4
  %sub.prol = fsub double %.pre, %mul.prol
  store double %sub.prol, double* %arrayidx16, align 8
  br label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.loopexit.unr-lcssa:                  ; preds = %for.inc.lr.ph, %for.inc.prol
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ undef, %for.inc.lr.ph ]
  %.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ %.pre, %for.inc.lr.ph ]
  %indvars.iv53.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.lr.ph ]
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol.loopexit.unr-lcssa
  %5 = icmp eq i64 %indvars.iv3355, 1
  br i1 %5, label %for.inc25.loopexit, label %for.inc.lr.ph.new

for.inc.lr.ph.new:                                ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph.new
  %6 = phi double [ %.unr.ph, %for.inc.lr.ph.new ], [ %sub.1, %for.inc ]
  %indvars.iv53 = phi i64 [ %indvars.iv53.unr.ph, %for.inc.lr.ph.new ], [ %indvars.iv.next.1, %for.inc ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv5062, i64 %indvars.iv53
  %7 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv53, i64 %indvars.iv3355
  %8 = load double, double* %arrayidx12, align 8
  %mul = fmul double %7, %8
  %sub = fsub double %6, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv53, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv5062, i64 %indvars.iv.next
  %9 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv3355
  %10 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %9, %10
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv53, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv3355
  br i1 %exitcond.1, label %for.inc25.loopexit.unr-lcssa, label %for.inc

for.inc25.loopexit.unr-lcssa:                     ; preds = %for.inc
  br label %for.inc25.loopexit

for.inc25.loopexit:                               ; preds = %for.inc.prol.loopexit, %for.inc25.loopexit.unr-lcssa
  %sub.lcssa = phi double [ %sub.lcssa.unr.ph, %for.inc.prol.loopexit ], [ %sub.1, %for.inc25.loopexit.unr-lcssa ]
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.cond4.preheader.for.inc25_crit_edge
  %arrayidx24.pre-phi = phi double* [ %.pre67, %for.cond4.preheader.for.inc25_crit_edge ], [ %arrayidx16, %for.inc25.loopexit ]
  %11 = phi double [ %.pre65, %for.cond4.preheader.for.inc25_crit_edge ], [ %sub.lcssa, %for.inc25.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv3355, i64 %indvars.iv3355
  %12 = load double, double* %arrayidx20, align 8
  %div = fdiv double %11, %12
  store double %div, double* %arrayidx24.pre-phi, align 8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv3355, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next34, %indvars.iv5062
  br i1 %exitcond38, label %for.cond28.preheader.loopexit, label %for.cond4.preheader

for.cond31.preheader:                             ; preds = %for.cond31.preheader.preheader, %for.inc51
  %indvars.iv4659 = phi i64 [ %indvars.iv.next47, %for.inc51 ], [ %indvars.iv5062, %for.cond31.preheader.preheader ]
  %arrayidx46 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv5062, i64 %indvars.iv4659
  %.pre66 = load double, double* %arrayidx46, align 8
  br i1 %lcmp.mod70, label %for.inc48.prol.loopexit.unr-lcssa, label %for.inc48.prol.preheader

for.inc48.prol.preheader:                         ; preds = %for.cond31.preheader
  br label %for.inc48.prol

for.inc48.prol:                                   ; preds = %for.inc48.prol.preheader
  %13 = load double, double* %arrayidx37.prol, align 8
  %arrayidx41.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv4659
  %14 = load double, double* %arrayidx41.prol, align 8
  %mul42.prol = fmul double %13, %14
  %sub47.prol = fsub double %.pre66, %mul42.prol
  store double %sub47.prol, double* %arrayidx46, align 8
  br label %for.inc48.prol.loopexit.unr-lcssa

for.inc48.prol.loopexit.unr-lcssa:                ; preds = %for.cond31.preheader, %for.inc48.prol
  %.unr71.ph = phi double [ %sub47.prol, %for.inc48.prol ], [ %.pre66, %for.cond31.preheader ]
  %indvars.iv3957.unr.ph = phi i64 [ 1, %for.inc48.prol ], [ 0, %for.cond31.preheader ]
  br label %for.inc48.prol.loopexit

for.inc48.prol.loopexit:                          ; preds = %for.inc48.prol.loopexit.unr-lcssa
  br i1 %2, label %for.inc51, label %for.cond31.preheader.new

for.cond31.preheader.new:                         ; preds = %for.inc48.prol.loopexit
  br label %for.inc48

for.inc48:                                        ; preds = %for.inc48, %for.cond31.preheader.new
  %15 = phi double [ %.unr71.ph, %for.cond31.preheader.new ], [ %sub47.1, %for.inc48 ]
  %indvars.iv3957 = phi i64 [ %indvars.iv3957.unr.ph, %for.cond31.preheader.new ], [ %indvars.iv.next40.1, %for.inc48 ]
  %arrayidx37 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv5062, i64 %indvars.iv3957
  %16 = load double, double* %arrayidx37, align 8
  %arrayidx41 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv3957, i64 %indvars.iv4659
  %17 = load double, double* %arrayidx41, align 8
  %mul42 = fmul double %16, %17
  %sub47 = fsub double %15, %mul42
  store double %sub47, double* %arrayidx46, align 8
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv3957, 1
  %arrayidx37.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv5062, i64 %indvars.iv.next40
  %18 = load double, double* %arrayidx37.1, align 8
  %arrayidx41.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next40, i64 %indvars.iv4659
  %19 = load double, double* %arrayidx41.1, align 8
  %mul42.1 = fmul double %18, %19
  %sub47.1 = fsub double %sub47, %mul42.1
  store double %sub47.1, double* %arrayidx46, align 8
  %indvars.iv.next40.1 = add nsw i64 %indvars.iv3957, 2
  %exitcond43.1 = icmp eq i64 %indvars.iv.next40.1, %indvars.iv5062
  br i1 %exitcond43.1, label %for.inc51.unr-lcssa, label %for.inc48

for.inc51.unr-lcssa:                              ; preds = %for.inc48
  br label %for.inc51

for.inc51:                                        ; preds = %for.inc48.prol.loopexit, %for.inc51.unr-lcssa
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv4659, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next47, %wide.trip.count48
  br i1 %exitcond49, label %for.inc54.loopexit, label %for.cond31.preheader

for.inc54.loopexit:                               ; preds = %for.inc51
  br label %for.inc54

for.inc54:                                        ; preds = %for.inc54.loopexit, %for.cond31.preheader.lr.ph, %for.cond28.preheader
  %indvars.iv5063 = phi i64 [ %wide.trip.count48, %for.cond28.preheader ], [ 0, %for.cond31.preheader.lr.ph ], [ %indvars.iv5062, %for.inc54.loopexit ]
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv5063, 1
  %cmp = icmp slt i64 %indvars.iv.next51, %0
  br i1 %cmp, label %for.cond1.preheader, label %for.end56.loopexit

for.end56.loopexit:                               ; preds = %for.inc54
  br label %for.end56

for.end56:                                        ; preds = %for.end56.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [2000 x double]* %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %3 = sext i32 %n to i64
  %cmp14 = icmp sgt i32 %n, 0
  br i1 %cmp14, label %for.cond2.preheader.preheader, label %for.end12

for.cond2.preheader.preheader:                    ; preds = %entry
  %wide.trip.count = zext i32 %n to i64
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %for.cond2.preheader.preheader
  %indvars.iv915 = phi i64 [ 0, %for.cond2.preheader.preheader ], [ %indvars.iv.next10, %for.inc10 ]
  %4 = mul nsw i64 %indvars.iv915, %3
  br label %for.body4

for.body4:                                        ; preds = %for.inc, %for.cond2.preheader
  %indvars.iv13 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %for.inc ]
  %5 = add nsw i64 %indvars.iv13, %4
  %6 = trunc i64 %5 to i32
  %rem = srem i32 %6, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body4
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body4, %if.then
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv915, i64 %indvars.iv13
  %9 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %for.inc
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv915, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next10, %3
  br i1 %exitcond18, label %for.end12.loopexit, label %for.cond2.preheader

for.end12.loopexit:                               ; preds = %for.inc10
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %11) #5
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
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7}
!7 = distinct !{!7, !5}
!8 = !{!9}
!9 = distinct !{!9, !5}
!10 = !{!7, !4}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.vectorize.width", i32 1}
!13 = !{!"llvm.loop.interleave.count", i32 1}
!14 = distinct !{!14, !12, !13}
!15 = !{!16}
!16 = distinct !{!16, !17}
!17 = distinct !{!17, !"LVerDomain"}
!18 = !{!19}
!19 = distinct !{!19, !17}
!20 = distinct !{!20, !12, !13}
!21 = distinct !{!21, !2}
!22 = distinct !{!22, !12, !13}
