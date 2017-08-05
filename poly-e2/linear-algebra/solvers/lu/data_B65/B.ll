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
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %.cast = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %.cast)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_lu(i32 2000, [2000 x double]* %.cast)
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
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %.cast)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* %A) unnamed_addr #0 {
entry:
  br label %for.inc.lr.ph

for.inc.lr.ph:                                    ; preds = %for.inc23, %entry
  %indvars.iv183 = phi i64 [ %indvars.iv.next184, %for.inc23 ], [ 1995, %entry ]
  %indvars.iv116 = phi i64 [ 0, %entry ], [ %indvars.iv.next117, %for.inc23 ]
  %indvars.iv114 = phi i64 [ 1, %entry ], [ %indvars.iv.next115, %for.inc23 ]
  %0 = lshr i64 %indvars.iv183, 2
  %1 = add i64 %0, 1
  %2 = trunc i64 %1 to i2
  %3 = zext i2 %2 to i64
  %4 = shl i64 %3, 2
  %5 = sub nuw nsw i64 1999, %indvars.iv116
  %6 = add nsw i64 %5, -4
  %7 = lshr i64 %6, 2
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph
  %indvars.iv101 = phi i64 [ 0, %for.inc.lr.ph ], [ %indvars.iv.next102, %for.inc ]
  %8 = sub nsw i64 0, %indvars.iv101
  %9 = trunc i64 %8 to i32
  %rem = srem i32 %9, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv116, i64 %indvars.iv101
  store double %add, double* %arrayidx6, align 8
  %indvars.iv.next102 = add nuw nsw i64 %indvars.iv101, 1
  %exitcond107 = icmp eq i64 %indvars.iv.next102, %indvars.iv114
  br i1 %exitcond107, label %for.end, label %for.inc

for.end:                                          ; preds = %for.inc
  %10 = add nuw nsw i64 %7, 1
  %11 = sub nuw nsw i64 1999, %indvars.iv116
  %indvars.iv.next117 = add nuw nsw i64 %indvars.iv116, 1
  %cmp964 = icmp slt i64 %indvars.iv.next117, 2000
  br i1 %cmp964, label %for.inc16.lr.ph, label %for.inc23

for.inc16.lr.ph:                                  ; preds = %for.end
  %min.iters.check = icmp ult i64 %11, 4
  br i1 %min.iters.check, label %for.inc16.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.inc16.lr.ph
  %n.vec = and i64 %11, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv114, %n.vec
  br i1 %cmp.zero, label %for.inc16.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %xtraiter = and i64 %10, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body.prol ], [ %xtraiter, %vector.body.prol.preheader ]
  %12 = add nuw nsw i64 %indvars.iv114, %index.prol
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv116, i64 %12
  %14 = bitcast double* %13 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %14, align 8
  %15 = getelementptr double, double* %13, i64 2
  %16 = bitcast double* %15 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %16, align 8
  %index.next.prol = add nuw nsw i64 %index.prol, 4
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %4, %vector.body.prol.loopexit.unr-lcssa ]
  %17 = icmp ult i64 %6, 12
  br i1 %17, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %18 = add i64 %indvars.iv114, %index
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv116, i64 %18
  %20 = bitcast double* %19 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %20, align 8
  %21 = getelementptr double, double* %19, i64 2
  %22 = bitcast double* %21 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %22, align 8
  %index.next = add i64 %index, 4
  %23 = add i64 %indvars.iv114, %index.next
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv116, i64 %23
  %25 = bitcast double* %24 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %25, align 8
  %26 = getelementptr double, double* %24, i64 2
  %27 = bitcast double* %26 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %27, align 8
  %index.next.1 = add i64 %index, 8
  %28 = add i64 %indvars.iv114, %index.next.1
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv116, i64 %28
  %30 = bitcast double* %29 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %30, align 8
  %31 = getelementptr double, double* %29, i64 2
  %32 = bitcast double* %31 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %32, align 8
  %index.next.2 = add i64 %index, 12
  %33 = add i64 %indvars.iv114, %index.next.2
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv116, i64 %33
  %35 = bitcast double* %34 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %35, align 8
  %36 = getelementptr double, double* %34, i64 2
  %37 = bitcast double* %36 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %37, align 8
  %index.next.3 = add i64 %index, 16
  %38 = icmp eq i64 %index.next.3, %n.vec
  br i1 %38, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !3

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %11, %n.vec
  br i1 %cmp.n, label %for.inc23, label %for.inc16.preheader

for.inc16.preheader:                              ; preds = %middle.block, %min.iters.checked, %for.inc16.lr.ph
  %indvars.iv110.ph = phi i64 [ %indvars.iv114, %min.iters.checked ], [ %indvars.iv114, %for.inc16.lr.ph ], [ %ind.end, %middle.block ]
  br label %for.inc16

for.inc16:                                        ; preds = %for.inc16.preheader, %for.inc16
  %indvars.iv110 = phi i64 [ %indvars.iv.next111, %for.inc16 ], [ %indvars.iv110.ph, %for.inc16.preheader ]
  %arrayidx15 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv116, i64 %indvars.iv110
  store double 0.000000e+00, double* %arrayidx15, align 8
  %exitcond122 = icmp eq i64 %indvars.iv110, 1999
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv110, 1
  br i1 %exitcond122, label %for.inc23.loopexit, label %for.inc16, !llvm.loop !6

for.inc23.loopexit:                               ; preds = %for.inc16
  br label %for.inc23

for.inc23:                                        ; preds = %for.inc23.loopexit, %middle.block, %for.end
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv116, i64 %indvars.iv116
  store double 1.000000e+00, double* %arrayidx22, align 8
  %exitcond119 = icmp eq i64 %indvars.iv.next117, 2000
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  %indvars.iv.next184 = add nsw i64 %indvars.iv183, -1
  br i1 %exitcond119, label %for.end25, label %for.inc.lr.ph

for.end25:                                        ; preds = %for.inc23
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %for.cond30.for.inc41_crit_edge.us

for.cond30.for.inc41_crit_edge.us:                ; preds = %for.cond30.for.inc41_crit_edge.us, %for.end25
  %indvars.iv97 = phi i64 [ 0, %for.end25 ], [ %indvars.iv.next98.7, %for.cond30.for.inc41_crit_edge.us ]
  %39 = mul nuw nsw i64 %indvars.iv97, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %39
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98 = or i64 %indvars.iv97, 1
  %40 = mul nuw nsw i64 %indvars.iv.next98, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %40
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98.1 = or i64 %indvars.iv97, 2
  %41 = mul nuw nsw i64 %indvars.iv.next98.1, 16000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98.2 = or i64 %indvars.iv97, 3
  %42 = mul nuw nsw i64 %indvars.iv.next98.2, 16000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %42
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98.3 = or i64 %indvars.iv97, 4
  %43 = mul nuw nsw i64 %indvars.iv.next98.3, 16000
  %scevgep.4 = getelementptr i8, i8* %call, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98.4 = or i64 %indvars.iv97, 5
  %44 = mul nuw nsw i64 %indvars.iv.next98.4, 16000
  %scevgep.5 = getelementptr i8, i8* %call, i64 %44
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98.5 = or i64 %indvars.iv97, 6
  %45 = mul nuw nsw i64 %indvars.iv.next98.5, 16000
  %scevgep.6 = getelementptr i8, i8* %call, i64 %45
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98.6 = or i64 %indvars.iv97, 7
  %46 = mul nuw nsw i64 %indvars.iv.next98.6, 16000
  %scevgep.7 = getelementptr i8, i8* %call, i64 %46
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %exitcond121.7 = icmp eq i64 %indvars.iv.next98.6, 1999
  %indvars.iv.next98.7 = add nuw nsw i64 %indvars.iv97, 8
  br i1 %exitcond121.7, label %for.body51.lr.ph.us.preheader, label %for.cond30.for.inc41_crit_edge.us

for.body51.lr.ph.us.preheader:                    ; preds = %for.cond30.for.inc41_crit_edge.us
  %47 = bitcast i8* %call to [2000 x [2000 x double]]*
  %48 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.body51.lr.ph.us

for.inc75.us:                                     ; preds = %for.cond52.for.inc72_crit_edge.us.us
  %exitcond92 = icmp eq i64 %49, 2000
  br i1 %exitcond92, label %for.body81.us.preheader, label %for.body51.lr.ph.us

for.body51.lr.ph.us:                              ; preds = %for.body51.lr.ph.us.preheader, %for.inc75.us
  %indvars.iv89 = phi i64 [ %49, %for.inc75.us ], [ 0, %for.body51.lr.ph.us.preheader ]
  %scevgep134 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv89
  %scevgep134135 = bitcast double* %scevgep134 to i8*
  %49 = add nuw nsw i64 %indvars.iv89, 1
  %scevgep136 = getelementptr [2000 x double], [2000 x double]* %A, i64 1999, i64 %49
  %scevgep136137 = bitcast double* %scevgep136 to i8*
  br label %for.body51.us.us

for.body51.us.us:                                 ; preds = %for.cond52.for.inc72_crit_edge.us.us, %for.body51.lr.ph.us
  %indvars.iv85 = phi i64 [ 0, %for.body51.lr.ph.us ], [ %indvars.iv.next86, %for.cond52.for.inc72_crit_edge.us.us ]
  %50 = mul nuw nsw i64 %indvars.iv85, 16000
  %scevgep132 = getelementptr i8, i8* %call, i64 %50
  %51 = add nuw nsw i64 %50, 16000
  %scevgep133 = getelementptr i8, i8* %call, i64 %51
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv85, i64 %indvars.iv89
  %bound0 = icmp ult i8* %scevgep132, %scevgep136137
  %bound1 = icmp ult i8* %scevgep134135, %scevgep133
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %arrayidx59.us.us to i8*
  %bound0139 = icmp ult i8* %scevgep132, %bc
  %bound1140 = icmp ult i8* %bc, %scevgep133
  %found.conflict141 = and i1 %bound0139, %bound1140
  %conflict.rdx = or i1 %found.conflict, %found.conflict141
  br i1 %conflict.rdx, label %for.inc69.us.us.preheader, label %vector.body127.preheader

vector.body127.preheader:                         ; preds = %for.body51.us.us
  br label %vector.body127

for.inc69.us.us.preheader:                        ; preds = %for.body51.us.us
  br label %for.inc69.us.us

vector.body127:                                   ; preds = %vector.body127.preheader, %vector.body127
  %index143 = phi i64 [ %index.next144, %vector.body127 ], [ 0, %vector.body127.preheader ]
  %52 = or i64 %index143, 1
  %53 = or i64 %index143, 2
  %54 = or i64 %index143, 3
  %55 = load double, double* %arrayidx59.us.us, align 8, !alias.scope !8
  %56 = insertelement <2 x double> undef, double %55, i32 0
  %57 = shufflevector <2 x double> %56, <2 x double> undef, <2 x i32> zeroinitializer
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %index143, i64 %indvars.iv89
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %52, i64 %indvars.iv89
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %53, i64 %indvars.iv89
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %54, i64 %indvars.iv89
  %62 = load double, double* %58, align 8, !alias.scope !11
  %63 = load double, double* %59, align 8, !alias.scope !11
  %64 = load double, double* %60, align 8, !alias.scope !11
  %65 = load double, double* %61, align 8, !alias.scope !11
  %66 = insertelement <2 x double> undef, double %62, i32 0
  %67 = insertelement <2 x double> %66, double %63, i32 1
  %68 = insertelement <2 x double> undef, double %64, i32 0
  %69 = insertelement <2 x double> %68, double %65, i32 1
  %70 = fmul <2 x double> %57, %67
  %71 = fmul <2 x double> %57, %69
  %72 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv85, i64 %index143
  %73 = bitcast double* %72 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %73, align 8, !alias.scope !13, !noalias !15
  %74 = getelementptr double, double* %72, i64 2
  %75 = bitcast double* %74 to <2 x double>*
  %wide.load151 = load <2 x double>, <2 x double>* %75, align 8, !alias.scope !13, !noalias !15
  %76 = fadd <2 x double> %70, %wide.load
  %77 = fadd <2 x double> %71, %wide.load151
  store <2 x double> %76, <2 x double>* %73, align 8, !alias.scope !13, !noalias !15
  store <2 x double> %77, <2 x double>* %75, align 8, !alias.scope !13, !noalias !15
  %index.next144 = add nuw nsw i64 %index143, 4
  %78 = icmp eq i64 %index.next144, 2000
  br i1 %78, label %for.cond52.for.inc72_crit_edge.us.us.loopexit182, label %vector.body127, !llvm.loop !16

for.cond52.for.inc72_crit_edge.us.us.loopexit:    ; preds = %for.inc69.us.us
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us.loopexit182: ; preds = %vector.body127
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us:             ; preds = %for.cond52.for.inc72_crit_edge.us.us.loopexit182, %for.cond52.for.inc72_crit_edge.us.us.loopexit
  %indvars.iv.next86 = add nuw nsw i64 %indvars.iv85, 1
  %exitcond88 = icmp eq i64 %indvars.iv.next86, 2000
  br i1 %exitcond88, label %for.inc75.us, label %for.body51.us.us

for.inc69.us.us:                                  ; preds = %for.inc69.us.us, %for.inc69.us.us.preheader
  %indvars.iv81 = phi i64 [ 0, %for.inc69.us.us.preheader ], [ %indvars.iv.next82.1, %for.inc69.us.us ]
  %79 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv81, i64 %indvars.iv89
  %80 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %79, %80
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv85, i64 %indvars.iv81
  %81 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %mul.us.us, %81
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next82 = or i64 %indvars.iv81, 1
  %82 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next82, i64 %indvars.iv89
  %83 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %82, %83
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv85, i64 %indvars.iv.next82
  %84 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %mul.us.us.1, %84
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next82, 1999
  %indvars.iv.next82.1 = add nuw nsw i64 %indvars.iv81, 2
  br i1 %exitcond.1, label %for.cond52.for.inc72_crit_edge.us.us.loopexit, label %for.inc69.us.us, !llvm.loop !17

for.body81.us.preheader:                          ; preds = %for.inc75.us
  br label %for.body81.us

for.body81.us:                                    ; preds = %for.cond82.for.inc97_crit_edge.us, %for.body81.us.preheader
  %indvars.iv77 = phi i64 [ 0, %for.body81.us.preheader ], [ %85, %for.cond82.for.inc97_crit_edge.us ]
  %scevgep157 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv77, i64 0
  %85 = add nuw nsw i64 %indvars.iv77, 1
  %scevgep159 = getelementptr [2000 x double], [2000 x double]* %A, i64 %85, i64 0
  %scevgep161 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv77, i64 0
  %scevgep163 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %85, i64 0
  %bound0165 = icmp ult double* %scevgep157, %scevgep163
  %bound1166 = icmp ult double* %scevgep161, %scevgep159
  %memcheck.conflict168 = and i1 %bound0165, %bound1166
  br i1 %memcheck.conflict168, label %for.inc94.us.preheader, label %vector.body152.preheader

vector.body152.preheader:                         ; preds = %for.body81.us
  br label %vector.body152

for.inc94.us.preheader:                           ; preds = %for.body81.us
  br label %for.inc94.us

vector.body152:                                   ; preds = %vector.body152, %vector.body152.preheader
  %index171 = phi i64 [ 0, %vector.body152.preheader ], [ %index.next172.1, %vector.body152 ]
  %86 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv77, i64 %index171
  %87 = bitcast double* %86 to <2 x i64>*
  %wide.load179 = load <2 x i64>, <2 x i64>* %87, align 8, !alias.scope !18
  %88 = getelementptr double, double* %86, i64 2
  %89 = bitcast double* %88 to <2 x i64>*
  %wide.load180 = load <2 x i64>, <2 x i64>* %89, align 8, !alias.scope !18
  %90 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv77, i64 %index171
  %91 = bitcast double* %90 to <2 x i64>*
  store <2 x i64> %wide.load179, <2 x i64>* %91, align 8, !alias.scope !21, !noalias !18
  %92 = getelementptr double, double* %90, i64 2
  %93 = bitcast double* %92 to <2 x i64>*
  store <2 x i64> %wide.load180, <2 x i64>* %93, align 8, !alias.scope !21, !noalias !18
  %index.next172 = or i64 %index171, 4
  %94 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv77, i64 %index.next172
  %95 = bitcast double* %94 to <2 x i64>*
  %wide.load179.1 = load <2 x i64>, <2 x i64>* %95, align 8, !alias.scope !18
  %96 = getelementptr double, double* %94, i64 2
  %97 = bitcast double* %96 to <2 x i64>*
  %wide.load180.1 = load <2 x i64>, <2 x i64>* %97, align 8, !alias.scope !18
  %98 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv77, i64 %index.next172
  %99 = bitcast double* %98 to <2 x i64>*
  store <2 x i64> %wide.load179.1, <2 x i64>* %99, align 8, !alias.scope !21, !noalias !18
  %100 = getelementptr double, double* %98, i64 2
  %101 = bitcast double* %100 to <2 x i64>*
  store <2 x i64> %wide.load180.1, <2 x i64>* %101, align 8, !alias.scope !21, !noalias !18
  %index.next172.1 = add nuw nsw i64 %index171, 8
  %102 = icmp eq i64 %index.next172.1, 2000
  br i1 %102, label %for.cond82.for.inc97_crit_edge.us.loopexit181, label %vector.body152, !llvm.loop !23

for.inc94.us:                                     ; preds = %for.inc94.us, %for.inc94.us.preheader
  %indvars.iv = phi i64 [ 0, %for.inc94.us.preheader ], [ %indvars.iv.next.4, %for.inc94.us ]
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv77, i64 %indvars.iv
  %103 = bitcast double* %arrayidx89.us to i64*
  %104 = load i64, i64* %103, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv77, i64 %indvars.iv
  %105 = bitcast double* %arrayidx93.us to i64*
  store i64 %104, i64* %105, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv77, i64 %indvars.iv.next
  %106 = bitcast double* %arrayidx89.us.1 to i64*
  %107 = load i64, i64* %106, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv77, i64 %indvars.iv.next
  %108 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %107, i64* %108, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv77, i64 %indvars.iv.next.1
  %109 = bitcast double* %arrayidx89.us.2 to i64*
  %110 = load i64, i64* %109, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv77, i64 %indvars.iv.next.1
  %111 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %110, i64* %111, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv77, i64 %indvars.iv.next.2
  %112 = bitcast double* %arrayidx89.us.3 to i64*
  %113 = load i64, i64* %112, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv77, i64 %indvars.iv.next.2
  %114 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %113, i64* %114, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %arrayidx89.us.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv77, i64 %indvars.iv.next.3
  %115 = bitcast double* %arrayidx89.us.4 to i64*
  %116 = load i64, i64* %115, align 8
  %arrayidx93.us.4 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv77, i64 %indvars.iv.next.3
  %117 = bitcast double* %arrayidx93.us.4 to i64*
  store i64 %116, i64* %117, align 8
  %exitcond120.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  br i1 %exitcond120.4, label %for.cond82.for.inc97_crit_edge.us.loopexit, label %for.inc94.us, !llvm.loop !24

for.cond82.for.inc97_crit_edge.us.loopexit:       ; preds = %for.inc94.us
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us.loopexit181:    ; preds = %vector.body152
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us:                ; preds = %for.cond82.for.inc97_crit_edge.us.loopexit181, %for.cond82.for.inc97_crit_edge.us.loopexit
  %exitcond80 = icmp eq i64 %85, 2000
  br i1 %exitcond80, label %for.cond82.for.inc97_crit_edge.us.for.end99_crit_edge, label %for.body81.us

for.cond82.for.inc97_crit_edge.us.for.end99_crit_edge: ; preds = %for.cond82.for.inc97_crit_edge.us
  tail call void @free(i8* %call) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32 %n, [2000 x double]* %A) unnamed_addr #2 {
entry:
  %A.addr = alloca [2000 x double]*, align 8
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8
  br label %for.body

for.body:                                         ; preds = %for.inc54, %entry
  %indvars.iv47 = phi i64 [ 0, %entry ], [ %indvars.iv.next48, %for.inc54 ]
  %0 = phi [2000 x double]* [ %A, %entry ], [ %22, %for.inc54 ]
  %cmp27 = icmp sgt i64 %indvars.iv47, 0
  br i1 %cmp27, label %for.body3.preheader, label %for.inc54

for.body3.preheader:                              ; preds = %for.body
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader, %for.inc25
  %indvars.iv29 = phi i64 [ %indvars.iv.next30, %for.inc25 ], [ 0, %for.body3.preheader ]
  %1 = phi [2000 x double]* [ %10, %for.inc25 ], [ %0, %for.body3.preheader ]
  %cmp55 = icmp sgt i64 %indvars.iv29, 0
  br i1 %cmp55, label %for.inc.lr.ph, label %for.inc25

for.inc.lr.ph:                                    ; preds = %for.body3
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv47, i64 %indvars.iv29
  %.pre = load double, double* %arrayidx16, align 8
  %xtraiter = and i64 %indvars.iv29, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.prol.loopexit.unr-lcssa, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.lr.ph
  br label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.prol.preheader
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv47, i64 0
  %2 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv29
  %3 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %2, %3
  %sub.prol = fsub double %.pre, %mul.prol
  store double %sub.prol, double* %arrayidx16, align 8
  br label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.loopexit.unr-lcssa:                  ; preds = %for.inc.lr.ph, %for.inc.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.lr.ph ]
  %.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ %.pre, %for.inc.lr.ph ]
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol.loopexit.unr-lcssa
  %4 = icmp eq i64 %indvars.iv29, 1
  br i1 %4, label %for.inc.for.inc25_crit_edge, label %for.inc.lr.ph.new

for.inc.lr.ph.new:                                ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc.lr.ph.new ], [ %indvars.iv.next.1, %for.inc ]
  %5 = phi double [ %.unr.ph, %for.inc.lr.ph.new ], [ %sub.1, %for.inc ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv47, i64 %indvars.iv
  %6 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv, i64 %indvars.iv29
  %7 = load double, double* %arrayidx12, align 8
  %mul = fmul double %6, %7
  %sub = fsub double %5, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv47, i64 %indvars.iv.next
  %8 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv29
  %9 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %8, %9
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv29
  br i1 %exitcond.1, label %for.inc.for.inc25_crit_edge.unr-lcssa, label %for.inc

for.inc.for.inc25_crit_edge.unr-lcssa:            ; preds = %for.inc
  br label %for.inc.for.inc25_crit_edge

for.inc.for.inc25_crit_edge:                      ; preds = %for.inc.prol.loopexit, %for.inc.for.inc25_crit_edge.unr-lcssa
  %.pre23 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.inc25

for.inc25:                                        ; preds = %for.body3, %for.inc.for.inc25_crit_edge
  %10 = phi [2000 x double]* [ %.pre23, %for.inc.for.inc25_crit_edge ], [ %1, %for.body3 ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv29, i64 %indvars.iv29
  %11 = load double, double* %arrayidx20, align 8
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %10, i64 %indvars.iv47, i64 %indvars.iv29
  %12 = load double, double* %arrayidx24, align 8
  %div = fdiv double %12, %11
  store double %div, double* %arrayidx24, align 8
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next30, %indvars.iv47
  br i1 %exitcond34, label %for.body30.lr.ph, label %for.body3

for.body30.lr.ph:                                 ; preds = %for.inc25
  %13 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %xtraiter51 = and i64 %indvars.iv47, 1
  %lcmp.mod52 = icmp eq i64 %xtraiter51, 0
  %14 = icmp eq i64 %indvars.iv47, 1
  %arrayidx37.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv47, i64 0
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.body30.lr.ph, %for.cond31.for.inc51_crit_edge.us
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %for.cond31.for.inc51_crit_edge.us ], [ %indvars.iv47, %for.body30.lr.ph ]
  %arrayidx46.us = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv47, i64 %indvars.iv43
  %.pre24 = load double, double* %arrayidx46.us, align 8
  br i1 %lcmp.mod52, label %for.inc48.us.prol.loopexit.unr-lcssa, label %for.inc48.us.prol.preheader

for.inc48.us.prol.preheader:                      ; preds = %for.body30.us
  br label %for.inc48.us.prol

for.inc48.us.prol:                                ; preds = %for.inc48.us.prol.preheader
  %15 = load double, double* %arrayidx37.us.prol, align 8
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 0, i64 %indvars.iv43
  %16 = load double, double* %arrayidx41.us.prol, align 8
  %mul42.us.prol = fmul double %15, %16
  %sub47.us.prol = fsub double %.pre24, %mul42.us.prol
  store double %sub47.us.prol, double* %arrayidx46.us, align 8
  br label %for.inc48.us.prol.loopexit.unr-lcssa

for.inc48.us.prol.loopexit.unr-lcssa:             ; preds = %for.body30.us, %for.inc48.us.prol
  %indvars.iv36.unr.ph = phi i64 [ 1, %for.inc48.us.prol ], [ 0, %for.body30.us ]
  %.unr53.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ %.pre24, %for.body30.us ]
  br label %for.inc48.us.prol.loopexit

for.inc48.us.prol.loopexit:                       ; preds = %for.inc48.us.prol.loopexit.unr-lcssa
  br i1 %14, label %for.cond31.for.inc51_crit_edge.us, label %for.body30.us.new

for.body30.us.new:                                ; preds = %for.inc48.us.prol.loopexit
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us, %for.body30.us.new
  %indvars.iv36 = phi i64 [ %indvars.iv36.unr.ph, %for.body30.us.new ], [ %indvars.iv.next37.1, %for.inc48.us ]
  %17 = phi double [ %.unr53.ph, %for.body30.us.new ], [ %sub47.us.1, %for.inc48.us ]
  %arrayidx37.us = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv47, i64 %indvars.iv36
  %18 = load double, double* %arrayidx37.us, align 8
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv36, i64 %indvars.iv43
  %19 = load double, double* %arrayidx41.us, align 8
  %mul42.us = fmul double %18, %19
  %sub47.us = fsub double %17, %mul42.us
  store double %sub47.us, double* %arrayidx46.us, align 8
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %arrayidx37.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv47, i64 %indvars.iv.next37
  %20 = load double, double* %arrayidx37.us.1, align 8
  %arrayidx41.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv.next37, i64 %indvars.iv43
  %21 = load double, double* %arrayidx41.us.1, align 8
  %mul42.us.1 = fmul double %20, %21
  %sub47.us.1 = fsub double %sub47.us, %mul42.us.1
  store double %sub47.us.1, double* %arrayidx46.us, align 8
  %indvars.iv.next37.1 = add nuw nsw i64 %indvars.iv36, 2
  %exitcond40.1 = icmp eq i64 %indvars.iv.next37.1, %indvars.iv47
  br i1 %exitcond40.1, label %for.cond31.for.inc51_crit_edge.us.unr-lcssa, label %for.inc48.us

for.cond31.for.inc51_crit_edge.us.unr-lcssa:      ; preds = %for.inc48.us
  br label %for.cond31.for.inc51_crit_edge.us

for.cond31.for.inc51_crit_edge.us:                ; preds = %for.inc48.us.prol.loopexit, %for.cond31.for.inc51_crit_edge.us.unr-lcssa
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next44, 2000
  br i1 %exitcond46, label %for.inc54.loopexit, label %for.body30.us

for.inc54.loopexit:                               ; preds = %for.cond31.for.inc51_crit_edge.us
  br label %for.inc54

for.inc54:                                        ; preds = %for.inc54.loopexit, %for.body
  %22 = phi [2000 x double]* [ %0, %for.body ], [ %13, %for.inc54.loopexit ]
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next48, 2000
  br i1 %exitcond50, label %for.end56, label %for.body

for.end56:                                        ; preds = %for.inc54
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [2000 x double]* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %indvars.iv8 = phi i64 [ 0, %entry ], [ %indvars.iv.next9, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nuw nsw i64 %indvars.iv8, 2000
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.body.us
  %indvars.iv = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next, %for.inc.us ]
  %4 = add nuw nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv8, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next9, 2000
  br i1 %exitcond12, label %for.end12, label %for.body.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #6
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
!13 = !{!14}
!14 = distinct !{!14, !10}
!15 = !{!12, !9}
!16 = distinct !{!16, !4, !5}
!17 = distinct !{!17, !4, !5}
!18 = !{!19}
!19 = distinct !{!19, !20}
!20 = distinct !{!20, !"LVerDomain"}
!21 = !{!22}
!22 = distinct !{!22, !20}
!23 = distinct !{!23, !4, !5}
!24 = distinct !{!24, !4, !5}
