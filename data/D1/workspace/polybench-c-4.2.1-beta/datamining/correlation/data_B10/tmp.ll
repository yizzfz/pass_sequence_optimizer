; ModuleID = 'A.ll'
source_filename = "correlation.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"corr\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %8 = bitcast i8* %4 to [1200 x double]*
  call fastcc void @init_array(i32 1200, i32 1400, double* nonnull %3, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  tail call fastcc void @kernel_correlation(i32 1200, i32 1400, double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %2, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %20, %4
  %indvars.iv12 = phi i64 [ 0, %4 ], [ %indvars.iv.next13, %20 ]
  %5 = trunc i64 %indvars.iv12 to i32
  %6 = sitofp i32 %5 to double
  br label %7

; <label>:7:                                      ; preds = %7, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %7 ]
  %8 = mul nuw nsw i64 %indvars.iv, %indvars.iv12
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 1.200000e+03
  %12 = fadd double %6, %11
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv12, i64 %indvars.iv
  store double %12, double* %13, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %14 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv12
  %15 = trunc i64 %14 to i32
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 1.200000e+03
  %18 = fadd double %6, %17
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv12, i64 %indvars.iv.next
  store double %18, double* %19, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %20, label %7

; <label>:20:                                     ; preds = %7
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond = icmp eq i64 %indvars.iv.next13, 1400
  br i1 %exitcond, label %21, label %._crit_edge

; <label>:21:                                     ; preds = %20
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph139, label %._crit_edge104

.lr.ph139:                                        ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph139.split.us.preheader, label %.lr.ph139.split.preheader

.lr.ph139.split.preheader:                        ; preds = %.lr.ph139
  %10 = add i32 %0, -1
  %xtraiter211 = and i32 %0, 3
  %lcmp.mod212 = icmp eq i32 %xtraiter211, 0
  br i1 %lcmp.mod212, label %.lr.ph139.split.prol.loopexit, label %.lr.ph139.split.prol.preheader

.lr.ph139.split.prol.preheader:                   ; preds = %.lr.ph139.split.preheader
  %11 = fdiv double 0.000000e+00, %2
  br label %.lr.ph139.split.prol

.lr.ph139.split.prol:                             ; preds = %.lr.ph139.split.prol.preheader, %.lr.ph139.split.prol
  %indvars.iv207.prol = phi i64 [ %indvars.iv.next208.prol, %.lr.ph139.split.prol ], [ 0, %.lr.ph139.split.prol.preheader ]
  %prol.iter213 = phi i32 [ %prol.iter213.sub, %.lr.ph139.split.prol ], [ %xtraiter211, %.lr.ph139.split.prol.preheader ]
  %12 = getelementptr inbounds double, double* %5, i64 %indvars.iv207.prol
  store double %11, double* %12, align 8
  %indvars.iv.next208.prol = add nuw nsw i64 %indvars.iv207.prol, 1
  %prol.iter213.sub = add i32 %prol.iter213, -1
  %prol.iter213.cmp = icmp eq i32 %prol.iter213.sub, 0
  br i1 %prol.iter213.cmp, label %.lr.ph139.split.prol.loopexit.loopexit, label %.lr.ph139.split.prol, !llvm.loop !1

.lr.ph139.split.prol.loopexit.loopexit:           ; preds = %.lr.ph139.split.prol
  br label %.lr.ph139.split.prol.loopexit

.lr.ph139.split.prol.loopexit:                    ; preds = %.lr.ph139.split.prol.loopexit.loopexit, %.lr.ph139.split.preheader
  %indvars.iv207.unr = phi i64 [ 0, %.lr.ph139.split.preheader ], [ %indvars.iv.next208.prol, %.lr.ph139.split.prol.loopexit.loopexit ]
  %13 = icmp ult i32 %10, 3
  br i1 %13, label %.lr.ph132, label %.lr.ph139.split.preheader219

.lr.ph139.split.preheader219:                     ; preds = %.lr.ph139.split.prol.loopexit
  %14 = fdiv double 0.000000e+00, %2
  %wide.trip.count209.3 = zext i32 %0 to i64
  %15 = add nsw i64 %wide.trip.count209.3, -4
  %16 = sub i64 %15, %indvars.iv207.unr
  %17 = lshr i64 %16, 2
  %18 = add nuw nsw i64 %17, 1
  %min.iters.check = icmp ult i64 %18, 4
  br i1 %min.iters.check, label %.lr.ph139.split.preheader238, label %min.iters.checked

.lr.ph139.split.preheader238:                     ; preds = %middle.block, %min.iters.checked, %.lr.ph139.split.preheader219
  %indvars.iv207.ph = phi i64 [ %indvars.iv207.unr, %min.iters.checked ], [ %indvars.iv207.unr, %.lr.ph139.split.preheader219 ], [ %ind.end, %middle.block ]
  br label %.lr.ph139.split

min.iters.checked:                                ; preds = %.lr.ph139.split.preheader219
  %n.mod.vf = and i64 %18, 3
  %n.vec = sub nsw i64 %18, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %19 = shl nuw i64 %17, 2
  %20 = add i64 %indvars.iv207.unr, %19
  %21 = add i64 %20, 4
  %22 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %21, %22
  br i1 %cmp.zero, label %.lr.ph139.split.preheader238, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert226 = insertelement <2 x double> undef, double %14, i32 0
  %interleaved.vec = shufflevector <2 x double> %broadcast.splatinsert226, <2 x double> undef, <8 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %23 = shl i64 %index, 2
  %offset.idx = add i64 %indvars.iv207.unr, %23
  %24 = add nsw i64 %offset.idx, 3
  %25 = add i64 %offset.idx, 11
  %26 = getelementptr inbounds double, double* %5, i64 %24
  %27 = getelementptr inbounds double, double* %5, i64 %25
  %28 = getelementptr double, double* %26, i64 -3
  %29 = bitcast double* %28 to <8 x double>*
  %30 = getelementptr double, double* %27, i64 -3
  %31 = bitcast double* %30 to <8 x double>*
  store <8 x double> %interleaved.vec, <8 x double>* %29, align 8
  store <8 x double> %interleaved.vec, <8 x double>* %31, align 8
  %index.next = add i64 %index, 4
  %32 = icmp eq i64 %index.next, %n.vec
  br i1 %32, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph139.split.preheader238

.lr.ph139.split.us.preheader:                     ; preds = %.lr.ph139
  %33 = add i32 %1, -1
  %xtraiter200 = and i32 %1, 3
  %lcmp.mod201 = icmp eq i32 %xtraiter200, 0
  %34 = icmp ult i32 %33, 3
  %wide.trip.count205 = zext i32 %0 to i64
  %wide.trip.count196.3 = zext i32 %1 to i64
  br label %.lr.ph139.split.us

.lr.ph139.split.us:                               ; preds = %._crit_edge136.us, %.lr.ph139.split.us.preheader
  %indvars.iv203 = phi i64 [ 0, %.lr.ph139.split.us.preheader ], [ %indvars.iv.next204, %._crit_edge136.us ]
  %35 = getelementptr inbounds double, double* %5, i64 %indvars.iv203
  store double 0.000000e+00, double* %35, align 8
  br i1 %lcmp.mod201, label %.prol.loopexit199, label %.prol.preheader198.preheader

.prol.preheader198.preheader:                     ; preds = %.lr.ph139.split.us
  br label %.prol.preheader198

.prol.preheader198:                               ; preds = %.prol.preheader198.preheader, %.prol.preheader198
  %36 = phi double [ %39, %.prol.preheader198 ], [ 0.000000e+00, %.prol.preheader198.preheader ]
  %indvars.iv194.prol = phi i64 [ %indvars.iv.next195.prol, %.prol.preheader198 ], [ 0, %.prol.preheader198.preheader ]
  %prol.iter202 = phi i32 [ %prol.iter202.sub, %.prol.preheader198 ], [ %xtraiter200, %.prol.preheader198.preheader ]
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv194.prol, i64 %indvars.iv203
  %38 = load double, double* %37, align 8
  %39 = fadd double %38, %36
  store double %39, double* %35, align 8
  %indvars.iv.next195.prol = add nuw nsw i64 %indvars.iv194.prol, 1
  %prol.iter202.sub = add i32 %prol.iter202, -1
  %prol.iter202.cmp = icmp eq i32 %prol.iter202.sub, 0
  br i1 %prol.iter202.cmp, label %.prol.loopexit199.loopexit, label %.prol.preheader198, !llvm.loop !6

.prol.loopexit199.loopexit:                       ; preds = %.prol.preheader198
  br label %.prol.loopexit199

.prol.loopexit199:                                ; preds = %.prol.loopexit199.loopexit, %.lr.ph139.split.us
  %40 = phi double [ 0.000000e+00, %.lr.ph139.split.us ], [ %39, %.prol.loopexit199.loopexit ]
  %indvars.iv194.unr = phi i64 [ 0, %.lr.ph139.split.us ], [ %indvars.iv.next195.prol, %.prol.loopexit199.loopexit ]
  br i1 %34, label %._crit_edge136.us, label %.lr.ph139.split.us.new.preheader

.lr.ph139.split.us.new.preheader:                 ; preds = %.prol.loopexit199
  br label %.lr.ph139.split.us.new

.lr.ph139.split.us.new:                           ; preds = %.lr.ph139.split.us.new.preheader, %.lr.ph139.split.us.new
  %41 = phi double [ %53, %.lr.ph139.split.us.new ], [ %40, %.lr.ph139.split.us.new.preheader ]
  %indvars.iv194 = phi i64 [ %indvars.iv.next195.3, %.lr.ph139.split.us.new ], [ %indvars.iv194.unr, %.lr.ph139.split.us.new.preheader ]
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv194, i64 %indvars.iv203
  %43 = load double, double* %42, align 8
  %44 = fadd double %43, %41
  store double %44, double* %35, align 8
  %indvars.iv.next195 = add nuw nsw i64 %indvars.iv194, 1
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next195, i64 %indvars.iv203
  %46 = load double, double* %45, align 8
  %47 = fadd double %46, %44
  store double %47, double* %35, align 8
  %indvars.iv.next195.1 = add nsw i64 %indvars.iv194, 2
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next195.1, i64 %indvars.iv203
  %49 = load double, double* %48, align 8
  %50 = fadd double %49, %47
  store double %50, double* %35, align 8
  %indvars.iv.next195.2 = add nsw i64 %indvars.iv194, 3
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next195.2, i64 %indvars.iv203
  %52 = load double, double* %51, align 8
  %53 = fadd double %52, %50
  store double %53, double* %35, align 8
  %indvars.iv.next195.3 = add nsw i64 %indvars.iv194, 4
  %exitcond197.3 = icmp eq i64 %indvars.iv.next195.3, %wide.trip.count196.3
  br i1 %exitcond197.3, label %._crit_edge136.us.loopexit, label %.lr.ph139.split.us.new

._crit_edge136.us.loopexit:                       ; preds = %.lr.ph139.split.us.new
  br label %._crit_edge136.us

._crit_edge136.us:                                ; preds = %._crit_edge136.us.loopexit, %.prol.loopexit199
  %54 = phi double [ %40, %.prol.loopexit199 ], [ %53, %._crit_edge136.us.loopexit ]
  %55 = fdiv double %54, %2
  store double %55, double* %35, align 8
  %indvars.iv.next204 = add nuw nsw i64 %indvars.iv203, 1
  %exitcond206 = icmp eq i64 %indvars.iv.next204, %wide.trip.count205
  br i1 %exitcond206, label %._crit_edge.loopexit, label %.lr.ph139.split.us

._crit_edge.loopexit:                             ; preds = %._crit_edge136.us
  br label %._crit_edge

._crit_edge.loopexit239:                          ; preds = %.lr.ph139.split
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit239, %._crit_edge.loopexit, %middle.block
  br i1 true, label %.lr.ph132, label %._crit_edge.._crit_edge104_crit_edge

._crit_edge.._crit_edge104_crit_edge:             ; preds = %._crit_edge
  br label %._crit_edge104

.lr.ph132:                                        ; preds = %.lr.ph139.split.prol.loopexit, %._crit_edge
  br i1 %9, label %.lr.ph132.split.us.preheader, label %.lr.ph132.split.preheader

.lr.ph132.split.us.preheader:                     ; preds = %.lr.ph132
  %xtraiter182 = and i32 %1, 1
  %lcmp.mod183 = icmp eq i32 %xtraiter182, 0
  %56 = icmp eq i32 %1, 1
  %wide.trip.count186 = zext i32 %0 to i64
  %wide.trip.count178.1 = zext i32 %1 to i64
  br label %.lr.ph132.split.us

.lr.ph132.split.preheader:                        ; preds = %.lr.ph132
  %xtraiter192 = and i32 %0, 1
  %lcmp.mod193 = icmp eq i32 %xtraiter192, 0
  br i1 %lcmp.mod193, label %.lr.ph132.split.prol.loopexit, label %.lr.ph132.split.prol

.lr.ph132.split.prol:                             ; preds = %.lr.ph132.split.preheader
  %57 = fdiv double 0.000000e+00, %2
  store double %57, double* %6, align 8
  %58 = tail call double @sqrt(double %57) #4
  %59 = fcmp ole double %58, 1.000000e-01
  %60 = select i1 %59, double 1.000000e+00, double %58
  store double %60, double* %6, align 8
  br label %.lr.ph132.split.prol.loopexit

.lr.ph132.split.prol.loopexit:                    ; preds = %.lr.ph132.split.preheader, %.lr.ph132.split.prol
  %indvars.iv188.unr = phi i64 [ 0, %.lr.ph132.split.preheader ], [ 1, %.lr.ph132.split.prol ]
  %61 = icmp eq i32 %0, 1
  br i1 %61, label %._crit_edge104, label %.lr.ph132.split.preheader217

.lr.ph132.split.preheader217:                     ; preds = %.lr.ph132.split.prol.loopexit
  %62 = fdiv double 0.000000e+00, %2
  %wide.trip.count190.1 = zext i32 %0 to i64
  br label %.lr.ph132.split

.lr.ph132.split.us:                               ; preds = %.lr.ph132.split.us.preheader, %._crit_edge130.us
  %indvars.iv184 = phi i64 [ %indvars.iv.next185, %._crit_edge130.us ], [ 0, %.lr.ph132.split.us.preheader ]
  %63 = getelementptr inbounds double, double* %6, i64 %indvars.iv184
  store double 0.000000e+00, double* %63, align 8
  %64 = getelementptr inbounds double, double* %5, i64 %indvars.iv184
  br i1 %lcmp.mod183, label %.prol.loopexit181, label %.prol.preheader180

.prol.preheader180:                               ; preds = %.lr.ph132.split.us
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv184
  %66 = load double, double* %65, align 8
  %67 = load double, double* %64, align 8
  %68 = fsub double %66, %67
  %69 = fmul double %68, %68
  %70 = fadd double %69, 0.000000e+00
  store double %70, double* %63, align 8
  br label %.prol.loopexit181

.prol.loopexit181:                                ; preds = %.prol.preheader180, %.lr.ph132.split.us
  %71 = phi double [ %70, %.prol.preheader180 ], [ 0.000000e+00, %.lr.ph132.split.us ]
  %indvars.iv176.unr.ph = phi i64 [ 1, %.prol.preheader180 ], [ 0, %.lr.ph132.split.us ]
  br i1 %56, label %._crit_edge130.us, label %.lr.ph132.split.us.new.preheader

.lr.ph132.split.us.new.preheader:                 ; preds = %.prol.loopexit181
  br label %.lr.ph132.split.us.new

.lr.ph132.split.us.new:                           ; preds = %.lr.ph132.split.us.new.preheader, %.lr.ph132.split.us.new
  %72 = phi double [ %84, %.lr.ph132.split.us.new ], [ %71, %.lr.ph132.split.us.new.preheader ]
  %indvars.iv176 = phi i64 [ %indvars.iv.next177.1, %.lr.ph132.split.us.new ], [ %indvars.iv176.unr.ph, %.lr.ph132.split.us.new.preheader ]
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv176, i64 %indvars.iv184
  %74 = load double, double* %73, align 8
  %75 = load double, double* %64, align 8
  %76 = fsub double %74, %75
  %77 = fmul double %76, %76
  %78 = fadd double %72, %77
  store double %78, double* %63, align 8
  %indvars.iv.next177 = add nuw nsw i64 %indvars.iv176, 1
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next177, i64 %indvars.iv184
  %80 = load double, double* %79, align 8
  %81 = load double, double* %64, align 8
  %82 = fsub double %80, %81
  %83 = fmul double %82, %82
  %84 = fadd double %78, %83
  store double %84, double* %63, align 8
  %indvars.iv.next177.1 = add nsw i64 %indvars.iv176, 2
  %exitcond179.1 = icmp eq i64 %indvars.iv.next177.1, %wide.trip.count178.1
  br i1 %exitcond179.1, label %._crit_edge130.us.loopexit, label %.lr.ph132.split.us.new

._crit_edge130.us.loopexit:                       ; preds = %.lr.ph132.split.us.new
  br label %._crit_edge130.us

._crit_edge130.us:                                ; preds = %._crit_edge130.us.loopexit, %.prol.loopexit181
  %85 = phi double [ %71, %.prol.loopexit181 ], [ %84, %._crit_edge130.us.loopexit ]
  %86 = fdiv double %85, %2
  store double %86, double* %63, align 8
  %87 = tail call double @sqrt(double %86) #4
  %88 = fcmp ole double %87, 1.000000e-01
  %89 = select i1 %88, double 1.000000e+00, double %87
  store double %89, double* %63, align 8
  %indvars.iv.next185 = add nuw nsw i64 %indvars.iv184, 1
  %exitcond187 = icmp eq i64 %indvars.iv.next185, %wide.trip.count186
  br i1 %exitcond187, label %._crit_edge104.loopexit, label %.lr.ph132.split.us

.lr.ph139.split:                                  ; preds = %.lr.ph139.split.preheader238, %.lr.ph139.split
  %indvars.iv207 = phi i64 [ %indvars.iv.next208.3, %.lr.ph139.split ], [ %indvars.iv207.ph, %.lr.ph139.split.preheader238 ]
  %90 = getelementptr inbounds double, double* %5, i64 %indvars.iv207
  store double %14, double* %90, align 8
  %indvars.iv.next208 = add nuw nsw i64 %indvars.iv207, 1
  %91 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next208
  store double %14, double* %91, align 8
  %indvars.iv.next208.1 = add nsw i64 %indvars.iv207, 2
  %92 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next208.1
  store double %14, double* %92, align 8
  %indvars.iv.next208.2 = add nsw i64 %indvars.iv207, 3
  %93 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next208.2
  store double %14, double* %93, align 8
  %indvars.iv.next208.3 = add nsw i64 %indvars.iv207, 4
  %exitcond210.3 = icmp eq i64 %indvars.iv.next208.3, %wide.trip.count209.3
  br i1 %exitcond210.3, label %._crit_edge.loopexit239, label %.lr.ph139.split, !llvm.loop !7

._crit_edge104.loopexit:                          ; preds = %._crit_edge130.us
  br label %._crit_edge104

._crit_edge104.loopexit237:                       ; preds = %.lr.ph132.split
  br label %._crit_edge104

._crit_edge104:                                   ; preds = %._crit_edge104.loopexit237, %._crit_edge104.loopexit, %._crit_edge.._crit_edge104_crit_edge, %7, %.lr.ph132.split.prol.loopexit
  %94 = icmp sgt i32 %1, 0
  br i1 %94, label %._crit_edge105.lr.ph, label %._crit_edge106

._crit_edge105.lr.ph:                             ; preds = %._crit_edge104
  br i1 %8, label %._crit_edge105.us.preheader, label %._crit_edge106.thread

._crit_edge105.us.preheader:                      ; preds = %._crit_edge105.lr.ph
  %wide.trip.count169 = zext i32 %0 to i64
  %wide.trip.count173 = zext i32 %1 to i64
  br label %._crit_edge105.us

._crit_edge106.thread:                            ; preds = %._crit_edge105.lr.ph
  %95 = add nsw i32 %0, -1
  br label %._crit_edge116

._crit_edge105.us:                                ; preds = %._crit_edge105.us.preheader, %._crit_edge125.us
  %indvars.iv171 = phi i64 [ %indvars.iv.next172, %._crit_edge125.us ], [ 0, %._crit_edge105.us.preheader ]
  br label %96

; <label>:96:                                     ; preds = %96, %._crit_edge105.us
  %indvars.iv167 = phi i64 [ 0, %._crit_edge105.us ], [ %indvars.iv.next168, %96 ]
  %97 = getelementptr inbounds double, double* %5, i64 %indvars.iv167
  %98 = load double, double* %97, align 8
  %99 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv171, i64 %indvars.iv167
  %100 = load double, double* %99, align 8
  %101 = fsub double %100, %98
  store double %101, double* %99, align 8
  %102 = tail call double @sqrt(double %2) #4
  %103 = getelementptr inbounds double, double* %6, i64 %indvars.iv167
  %104 = load double, double* %103, align 8
  %105 = fmul double %102, %104
  %106 = load double, double* %99, align 8
  %107 = fdiv double %106, %105
  store double %107, double* %99, align 8
  %indvars.iv.next168 = add nuw nsw i64 %indvars.iv167, 1
  %exitcond170 = icmp eq i64 %indvars.iv.next168, %wide.trip.count169
  br i1 %exitcond170, label %._crit_edge125.us, label %96

._crit_edge125.us:                                ; preds = %96
  %indvars.iv.next172 = add nuw nsw i64 %indvars.iv171, 1
  %exitcond174 = icmp eq i64 %indvars.iv.next172, %wide.trip.count173
  br i1 %exitcond174, label %._crit_edge106.loopexit, label %._crit_edge105.us

.lr.ph132.split:                                  ; preds = %.lr.ph132.split.preheader217, %.lr.ph132.split
  %indvars.iv188 = phi i64 [ %indvars.iv.next189.1, %.lr.ph132.split ], [ %indvars.iv188.unr, %.lr.ph132.split.preheader217 ]
  %108 = getelementptr inbounds double, double* %6, i64 %indvars.iv188
  store double %62, double* %108, align 8
  %109 = tail call double @sqrt(double %62) #4
  %110 = fcmp ole double %109, 1.000000e-01
  %111 = select i1 %110, double 1.000000e+00, double %109
  store double %111, double* %108, align 8
  %indvars.iv.next189 = add nuw nsw i64 %indvars.iv188, 1
  %112 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next189
  store double %62, double* %112, align 8
  %113 = tail call double @sqrt(double %62) #4
  %114 = fcmp ole double %113, 1.000000e-01
  %115 = select i1 %114, double 1.000000e+00, double %113
  store double %115, double* %112, align 8
  %indvars.iv.next189.1 = add nsw i64 %indvars.iv188, 2
  %exitcond191.1 = icmp eq i64 %indvars.iv.next189.1, %wide.trip.count190.1
  br i1 %exitcond191.1, label %._crit_edge104.loopexit237, label %.lr.ph132.split

._crit_edge106.loopexit:                          ; preds = %._crit_edge125.us
  br label %._crit_edge106

._crit_edge106:                                   ; preds = %._crit_edge106.loopexit, %._crit_edge104
  %116 = add nsw i32 %0, -1
  %117 = icmp sgt i32 %0, 1
  br i1 %117, label %.lr.ph115, label %._crit_edge116

.lr.ph115:                                        ; preds = %._crit_edge106
  br i1 %94, label %.lr.ph115.split.us.preheader, label %.lr.ph115.split.preheader

.lr.ph115.split.preheader:                        ; preds = %.lr.ph115
  %118 = zext i32 %116 to i64
  %119 = add i32 %0, -2
  %120 = zext i32 %119 to i64
  %121 = sext i32 %0 to i64
  %wide.trip.count158.3 = zext i32 %0 to i64
  br label %.lr.ph115.split

.lr.ph115.split.us.preheader:                     ; preds = %.lr.ph115
  %122 = sext i32 %0 to i64
  %wide.trip.count152 = zext i32 %116 to i64
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %123 = icmp eq i32 %1, 1
  %wide.trip.count148 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %1 to i64
  br label %.lr.ph115.split.us

.lr.ph115.split.us:                               ; preds = %._crit_edge107.us, %.lr.ph115.split.us.preheader
  %indvars.iv150 = phi i64 [ 0, %.lr.ph115.split.us.preheader ], [ %indvars.iv.next151, %._crit_edge107.us ]
  %indvars.iv144 = phi i64 [ 1, %.lr.ph115.split.us.preheader ], [ %indvars.iv.next145, %._crit_edge107.us ]
  %124 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv150, i64 %indvars.iv150
  store double 1.000000e+00, double* %124, align 8
  %indvars.iv.next151 = add nuw nsw i64 %indvars.iv150, 1
  %125 = icmp slt i64 %indvars.iv.next151, %122
  br i1 %125, label %.lr.ph.us.us.preheader, label %._crit_edge107.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph115.split.us
  %126 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv150
  br label %.lr.ph.us.us

._crit_edge107.us.loopexit:                       ; preds = %._crit_edge110.us.us
  br label %._crit_edge107.us

._crit_edge107.us:                                ; preds = %._crit_edge107.us.loopexit, %.lr.ph115.split.us
  %indvars.iv.next145 = add nuw nsw i64 %indvars.iv144, 1
  %exitcond153 = icmp eq i64 %indvars.iv.next151, %wide.trip.count152
  br i1 %exitcond153, label %._crit_edge116.loopexit, label %.lr.ph115.split.us

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge110.us.us
  %indvars.iv146 = phi i64 [ %indvars.iv.next147, %._crit_edge110.us.us ], [ %indvars.iv144, %.lr.ph.us.us.preheader ]
  %127 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv150, i64 %indvars.iv146
  store double 0.000000e+00, double* %127, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %128 = load double, double* %126, align 8
  %129 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv146
  %130 = load double, double* %129, align 8
  %131 = fmul double %128, %130
  %132 = fadd double %131, 0.000000e+00
  store double %132, double* %127, align 8
  %133 = bitcast double %132 to i64
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %134 = phi i64 [ %133, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  %135 = phi double [ %132, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %123, label %._crit_edge110.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge110.us.us.loopexit:                    ; preds = %.lr.ph.us.us.new
  %136 = bitcast double %152 to i64
  br label %._crit_edge110.us.us

._crit_edge110.us.us:                             ; preds = %._crit_edge110.us.us.loopexit, %.prol.loopexit
  %137 = phi i64 [ %134, %.prol.loopexit ], [ %136, %._crit_edge110.us.us.loopexit ]
  %138 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv146, i64 %indvars.iv150
  %139 = bitcast double* %138 to i64*
  store i64 %137, i64* %139, align 8
  %indvars.iv.next147 = add nuw nsw i64 %indvars.iv146, 1
  %exitcond = icmp eq i64 %indvars.iv.next147, %wide.trip.count148
  br i1 %exitcond, label %._crit_edge107.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %140 = phi double [ %152, %.lr.ph.us.us.new ], [ %135, %.lr.ph.us.us.new.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %141 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv150
  %142 = load double, double* %141, align 8
  %143 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv146
  %144 = load double, double* %143, align 8
  %145 = fmul double %142, %144
  %146 = fadd double %140, %145
  store double %146, double* %127, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %147 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv150
  %148 = load double, double* %147, align 8
  %149 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv146
  %150 = load double, double* %149, align 8
  %151 = fmul double %148, %150
  %152 = fadd double %146, %151
  store double %152, double* %127, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge110.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph115.split:                                  ; preds = %._crit_edge107, %.lr.ph115.split.preheader
  %indvars.iv163 = phi i64 [ 0, %.lr.ph115.split.preheader ], [ %indvars.iv.next164, %._crit_edge107 ]
  %indvars.iv154 = phi i64 [ 1, %.lr.ph115.split.preheader ], [ %indvars.iv.next155, %._crit_edge107 ]
  %153 = sub i64 %120, %indvars.iv163
  %154 = trunc i64 %153 to i32
  %155 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv163, i64 %indvars.iv163
  store double 1.000000e+00, double* %155, align 8
  %indvars.iv.next164 = add nuw nsw i64 %indvars.iv163, 1
  %156 = icmp slt i64 %indvars.iv.next164, %121
  br i1 %156, label %.lr.ph113.split.preheader, label %._crit_edge107

.lr.ph113.split.preheader:                        ; preds = %.lr.ph115.split
  %157 = sub i64 %118, %indvars.iv163
  %158 = trunc i64 %157 to i32
  %xtraiter161 = and i32 %158, 3
  %lcmp.mod162 = icmp eq i32 %xtraiter161, 0
  br i1 %lcmp.mod162, label %.lr.ph113.split.prol.loopexit, label %.lr.ph113.split.prol.preheader

.lr.ph113.split.prol.preheader:                   ; preds = %.lr.ph113.split.preheader
  br label %.lr.ph113.split.prol

.lr.ph113.split.prol:                             ; preds = %.lr.ph113.split.prol.preheader, %.lr.ph113.split.prol
  %indvars.iv156.prol = phi i64 [ %indvars.iv.next157.prol, %.lr.ph113.split.prol ], [ %indvars.iv154, %.lr.ph113.split.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph113.split.prol ], [ %xtraiter161, %.lr.ph113.split.prol.preheader ]
  %159 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv163, i64 %indvars.iv156.prol
  store double 0.000000e+00, double* %159, align 8
  %160 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv156.prol, i64 %indvars.iv163
  %161 = bitcast double* %160 to i64*
  store i64 0, i64* %161, align 8
  %indvars.iv.next157.prol = add nuw nsw i64 %indvars.iv156.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph113.split.prol.loopexit.loopexit, label %.lr.ph113.split.prol, !llvm.loop !9

.lr.ph113.split.prol.loopexit.loopexit:           ; preds = %.lr.ph113.split.prol
  br label %.lr.ph113.split.prol.loopexit

.lr.ph113.split.prol.loopexit:                    ; preds = %.lr.ph113.split.prol.loopexit.loopexit, %.lr.ph113.split.preheader
  %indvars.iv156.unr = phi i64 [ %indvars.iv154, %.lr.ph113.split.preheader ], [ %indvars.iv.next157.prol, %.lr.ph113.split.prol.loopexit.loopexit ]
  %162 = icmp ult i32 %154, 3
  br i1 %162, label %._crit_edge107, label %.lr.ph113.split.preheader235

.lr.ph113.split.preheader235:                     ; preds = %.lr.ph113.split.prol.loopexit
  br label %.lr.ph113.split

._crit_edge107.loopexit:                          ; preds = %.lr.ph113.split
  br label %._crit_edge107

._crit_edge107:                                   ; preds = %._crit_edge107.loopexit, %.lr.ph113.split.prol.loopexit, %.lr.ph115.split
  %indvars.iv.next155 = add nuw nsw i64 %indvars.iv154, 1
  %exitcond166 = icmp eq i64 %indvars.iv.next164, %118
  br i1 %exitcond166, label %._crit_edge116.loopexit236, label %.lr.ph115.split

.lr.ph113.split:                                  ; preds = %.lr.ph113.split.preheader235, %.lr.ph113.split
  %indvars.iv156 = phi i64 [ %indvars.iv.next157.3, %.lr.ph113.split ], [ %indvars.iv156.unr, %.lr.ph113.split.preheader235 ]
  %163 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv163, i64 %indvars.iv156
  store double 0.000000e+00, double* %163, align 8
  %164 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv156, i64 %indvars.iv163
  %165 = bitcast double* %164 to i64*
  store i64 0, i64* %165, align 8
  %indvars.iv.next157 = add nuw nsw i64 %indvars.iv156, 1
  %166 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv163, i64 %indvars.iv.next157
  store double 0.000000e+00, double* %166, align 8
  %167 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next157, i64 %indvars.iv163
  %168 = bitcast double* %167 to i64*
  store i64 0, i64* %168, align 8
  %indvars.iv.next157.1 = add nsw i64 %indvars.iv156, 2
  %169 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv163, i64 %indvars.iv.next157.1
  store double 0.000000e+00, double* %169, align 8
  %170 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next157.1, i64 %indvars.iv163
  %171 = bitcast double* %170 to i64*
  store i64 0, i64* %171, align 8
  %indvars.iv.next157.2 = add nsw i64 %indvars.iv156, 3
  %172 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv163, i64 %indvars.iv.next157.2
  store double 0.000000e+00, double* %172, align 8
  %173 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next157.2, i64 %indvars.iv163
  %174 = bitcast double* %173 to i64*
  store i64 0, i64* %174, align 8
  %indvars.iv.next157.3 = add nsw i64 %indvars.iv156, 4
  %exitcond159.3 = icmp eq i64 %indvars.iv.next157.3, %wide.trip.count158.3
  br i1 %exitcond159.3, label %._crit_edge107.loopexit, label %.lr.ph113.split

._crit_edge116.loopexit:                          ; preds = %._crit_edge107.us
  br label %._crit_edge116

._crit_edge116.loopexit236:                       ; preds = %._crit_edge107
  br label %._crit_edge116

._crit_edge116:                                   ; preds = %._crit_edge116.loopexit236, %._crit_edge116.loopexit, %._crit_edge106.thread, %._crit_edge106
  %175 = phi i32 [ %95, %._crit_edge106.thread ], [ %116, %._crit_edge106 ], [ %116, %._crit_edge116.loopexit ], [ %116, %._crit_edge116.loopexit236 ]
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %176, i64 %176
  store double 1.000000e+00, double* %177, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %._crit_edge.us.preheader, label %._crit_edge15

._crit_edge.us.preheader:                         ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge13.us, %._crit_edge.us.preheader
  %indvars.iv16 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next17, %._crit_edge13.us ]
  %9 = mul nsw i64 %indvars.iv16, %8
  br label %10

; <label>:10:                                     ; preds = %._crit_edge11.us, %._crit_edge.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next, %._crit_edge11.us ]
  %11 = add nsw i64 %indvars.iv, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %._crit_edge11.us

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %10, %15
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv16, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge13.us, label %10

._crit_edge13.us:                                 ; preds = %._crit_edge11.us
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next17, %wide.trip.count
  br i1 %exitcond19, label %._crit_edge15.loopexit, label %._crit_edge.us

._crit_edge15.loopexit:                           ; preds = %._crit_edge13.us
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %2
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !2}
!7 = distinct !{!7, !8, !4, !5}
!8 = !{!"llvm.loop.unroll.runtime.disable"}
!9 = distinct !{!9, !2}
