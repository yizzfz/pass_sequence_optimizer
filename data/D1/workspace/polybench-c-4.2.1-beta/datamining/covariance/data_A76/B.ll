; ModuleID = 'A.ll'
source_filename = "covariance.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"cov\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %7 = bitcast i8* %4 to [1200 x double]*
  call void @init_array(i32 1200, i32 1400, double* nonnull %3, [1200 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  call void @kernel_covariance(i32 1200, i32 1400, double %8, [1200 x double]* %7, [1200 x double]* %9, double* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %16

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %16

; <label>:15:                                     ; preds = %12
  call void @print_array(i32 1200, [1200 x double]* %9)
  br label %16

; <label>:16:                                     ; preds = %12, %15, %2
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, double*, [1200 x double]*) #2 {
  %5 = sitofp i32 %1 to double
  store double %5, double* %2, align 8
  br label %.preheader

.preheader:                                       ; preds = %19, %4
  %indvars.iv12 = phi i64 [ 0, %4 ], [ %indvars.iv.next13, %19 ]
  %6 = trunc i64 %indvars.iv12 to i32
  %7 = sitofp i32 %6 to double
  br label %8

; <label>:8:                                      ; preds = %8, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %8 ]
  %9 = trunc i64 %indvars.iv to i32
  %10 = sitofp i32 %9 to double
  %11 = fmul double %7, %10
  %12 = fdiv double %11, 1.200000e+03
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv12, i64 %indvars.iv
  store double %12, double* %13, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %14 = trunc i64 %indvars.iv.next to i32
  %15 = sitofp i32 %14 to double
  %16 = fmul double %7, %15
  %17 = fdiv double %16, 1.200000e+03
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv12, i64 %indvars.iv.next
  store double %17, double* %18, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %19, label %8

; <label>:19:                                     ; preds = %8
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond = icmp eq i64 %indvars.iv.next13, 1400
  br i1 %exitcond, label %20, label %.preheader

; <label>:20:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_covariance(i32, i32, double, [1200 x double]*, [1200 x double]*, double*) #2 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph87, label %.preheader64

.lr.ph87:                                         ; preds = %6
  %8 = icmp sgt i32 %1, 0
  br i1 %8, label %.lr.ph87.split.us.preheader, label %.lr.ph87.split.preheader

.lr.ph87.split.preheader:                         ; preds = %.lr.ph87
  %9 = add i32 %0, -1
  %xtraiter145 = and i32 %0, 3
  %lcmp.mod146 = icmp eq i32 %xtraiter145, 0
  br i1 %lcmp.mod146, label %.lr.ph87.split.prol.loopexit, label %.lr.ph87.split.prol.preheader

.lr.ph87.split.prol.preheader:                    ; preds = %.lr.ph87.split.preheader
  %10 = fdiv double 0.000000e+00, %2
  br label %.lr.ph87.split.prol

.lr.ph87.split.prol:                              ; preds = %.lr.ph87.split.prol.preheader, %.lr.ph87.split.prol
  %indvars.iv141.prol = phi i64 [ %indvars.iv.next142.prol, %.lr.ph87.split.prol ], [ 0, %.lr.ph87.split.prol.preheader ]
  %prol.iter147 = phi i32 [ %prol.iter147.sub, %.lr.ph87.split.prol ], [ %xtraiter145, %.lr.ph87.split.prol.preheader ]
  %11 = getelementptr inbounds double, double* %5, i64 %indvars.iv141.prol
  store double %10, double* %11, align 8
  %indvars.iv.next142.prol = add nuw nsw i64 %indvars.iv141.prol, 1
  %prol.iter147.sub = add i32 %prol.iter147, -1
  %prol.iter147.cmp = icmp eq i32 %prol.iter147.sub, 0
  br i1 %prol.iter147.cmp, label %.lr.ph87.split.prol.loopexit.loopexit, label %.lr.ph87.split.prol, !llvm.loop !1

.lr.ph87.split.prol.loopexit.loopexit:            ; preds = %.lr.ph87.split.prol
  br label %.lr.ph87.split.prol.loopexit

.lr.ph87.split.prol.loopexit:                     ; preds = %.lr.ph87.split.prol.loopexit.loopexit, %.lr.ph87.split.preheader
  %indvars.iv141.unr = phi i64 [ 0, %.lr.ph87.split.preheader ], [ %indvars.iv.next142.prol, %.lr.ph87.split.prol.loopexit.loopexit ]
  %12 = icmp ult i32 %9, 3
  br i1 %12, label %.preheader64, label %.lr.ph87.split.preheader150

.lr.ph87.split.preheader150:                      ; preds = %.lr.ph87.split.prol.loopexit
  %13 = fdiv double 0.000000e+00, %2
  %14 = fdiv double 0.000000e+00, %2
  %15 = fdiv double 0.000000e+00, %2
  %16 = fdiv double 0.000000e+00, %2
  %wide.trip.count143.3 = zext i32 %0 to i64
  %17 = add nsw i64 %wide.trip.count143.3, -4
  %18 = sub i64 %17, %indvars.iv141.unr
  %19 = lshr i64 %18, 2
  %20 = add nuw nsw i64 %19, 1
  %min.iters.check = icmp ult i64 %20, 4
  br i1 %min.iters.check, label %.lr.ph87.split.preheader204, label %min.iters.checked

.lr.ph87.split.preheader204:                      ; preds = %middle.block, %min.iters.checked, %.lr.ph87.split.preheader150
  %indvars.iv141.ph = phi i64 [ %indvars.iv141.unr, %min.iters.checked ], [ %indvars.iv141.unr, %.lr.ph87.split.preheader150 ], [ %ind.end, %middle.block ]
  br label %.lr.ph87.split

min.iters.checked:                                ; preds = %.lr.ph87.split.preheader150
  %n.mod.vf = and i64 %20, 3
  %n.vec = sub nsw i64 %20, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %21 = shl nuw i64 %19, 2
  %22 = add i64 %indvars.iv141.unr, %21
  %23 = add i64 %22, 4
  %24 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %23, %24
  br i1 %cmp.zero, label %.lr.ph87.split.preheader204, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert155 = insertelement <2 x double> undef, double %13, i32 0
  %broadcast.splat156 = shufflevector <2 x double> %broadcast.splatinsert155, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert157 = insertelement <2 x double> undef, double %14, i32 0
  %broadcast.splat158 = shufflevector <2 x double> %broadcast.splatinsert157, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert159 = insertelement <2 x double> undef, double %15, i32 0
  %broadcast.splat160 = shufflevector <2 x double> %broadcast.splatinsert159, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert161 = insertelement <2 x double> undef, double %16, i32 0
  %broadcast.splat162 = shufflevector <2 x double> %broadcast.splatinsert161, <2 x double> undef, <2 x i32> zeroinitializer
  %25 = shufflevector <2 x double> %broadcast.splat156, <2 x double> %broadcast.splat158, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %26 = shufflevector <2 x double> %broadcast.splat160, <2 x double> %broadcast.splat162, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %25, <4 x double> %26, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %27 = shl i64 %index, 2
  %offset.idx = add i64 %indvars.iv141.unr, %27
  %28 = add i64 %indvars.iv141.unr, %27
  %29 = add nsw i64 %28, 3
  %30 = add i64 %offset.idx, 11
  %31 = getelementptr inbounds double, double* %5, i64 %29
  %32 = getelementptr inbounds double, double* %5, i64 %30
  %33 = getelementptr double, double* %31, i64 -3
  %34 = bitcast double* %33 to <8 x double>*
  %35 = getelementptr double, double* %32, i64 -3
  %36 = bitcast double* %35 to <8 x double>*
  store <8 x double> %interleaved.vec, <8 x double>* %34, align 8
  store <8 x double> %interleaved.vec, <8 x double>* %36, align 8
  %index.next = add i64 %index, 4
  %37 = icmp eq i64 %index.next, %n.vec
  br i1 %37, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.preheader64, label %.lr.ph87.split.preheader204

.lr.ph87.split.us.preheader:                      ; preds = %.lr.ph87
  %38 = add i32 %1, -1
  %xtraiter134 = and i32 %1, 3
  %lcmp.mod135 = icmp eq i32 %xtraiter134, 0
  %39 = icmp ult i32 %38, 3
  %wide.trip.count139 = zext i32 %0 to i64
  %wide.trip.count130.3 = zext i32 %1 to i64
  br label %.lr.ph87.split.us

.lr.ph87.split.us:                                ; preds = %._crit_edge84.us, %.lr.ph87.split.us.preheader
  %indvars.iv137 = phi i64 [ 0, %.lr.ph87.split.us.preheader ], [ %indvars.iv.next138, %._crit_edge84.us ]
  %40 = getelementptr inbounds double, double* %5, i64 %indvars.iv137
  store double 0.000000e+00, double* %40, align 8
  br i1 %lcmp.mod135, label %.prol.loopexit133, label %.prol.preheader132.preheader

.prol.preheader132.preheader:                     ; preds = %.lr.ph87.split.us
  br label %.prol.preheader132

.prol.preheader132:                               ; preds = %.prol.preheader132.preheader, %.prol.preheader132
  %indvars.iv128.prol = phi i64 [ %indvars.iv.next129.prol, %.prol.preheader132 ], [ 0, %.prol.preheader132.preheader ]
  %prol.iter136 = phi i32 [ %prol.iter136.sub, %.prol.preheader132 ], [ %xtraiter134, %.prol.preheader132.preheader ]
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv128.prol, i64 %indvars.iv137
  %42 = load double, double* %41, align 8
  %43 = load double, double* %40, align 8
  %44 = fadd double %42, %43
  store double %44, double* %40, align 8
  %indvars.iv.next129.prol = add nuw nsw i64 %indvars.iv128.prol, 1
  %prol.iter136.sub = add i32 %prol.iter136, -1
  %prol.iter136.cmp = icmp eq i32 %prol.iter136.sub, 0
  br i1 %prol.iter136.cmp, label %.prol.loopexit133.loopexit, label %.prol.preheader132, !llvm.loop !6

.prol.loopexit133.loopexit:                       ; preds = %.prol.preheader132
  br label %.prol.loopexit133

.prol.loopexit133:                                ; preds = %.prol.loopexit133.loopexit, %.lr.ph87.split.us
  %indvars.iv128.unr = phi i64 [ 0, %.lr.ph87.split.us ], [ %indvars.iv.next129.prol, %.prol.loopexit133.loopexit ]
  br i1 %39, label %._crit_edge84.us, label %.lr.ph87.split.us.new.preheader

.lr.ph87.split.us.new.preheader:                  ; preds = %.prol.loopexit133
  br label %.lr.ph87.split.us.new

.lr.ph87.split.us.new:                            ; preds = %.lr.ph87.split.us.new.preheader, %.lr.ph87.split.us.new
  %indvars.iv128 = phi i64 [ %indvars.iv.next129.3, %.lr.ph87.split.us.new ], [ %indvars.iv128.unr, %.lr.ph87.split.us.new.preheader ]
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv128, i64 %indvars.iv137
  %46 = load double, double* %45, align 8
  %47 = load double, double* %40, align 8
  %48 = fadd double %46, %47
  store double %48, double* %40, align 8
  %indvars.iv.next129 = add nuw nsw i64 %indvars.iv128, 1
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next129, i64 %indvars.iv137
  %50 = load double, double* %49, align 8
  %51 = fadd double %50, %48
  store double %51, double* %40, align 8
  %indvars.iv.next129.1 = add nsw i64 %indvars.iv128, 2
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next129.1, i64 %indvars.iv137
  %53 = load double, double* %52, align 8
  %54 = fadd double %53, %51
  store double %54, double* %40, align 8
  %indvars.iv.next129.2 = add nsw i64 %indvars.iv128, 3
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next129.2, i64 %indvars.iv137
  %56 = load double, double* %55, align 8
  %57 = fadd double %56, %54
  store double %57, double* %40, align 8
  %indvars.iv.next129.3 = add nsw i64 %indvars.iv128, 4
  %exitcond131.3 = icmp eq i64 %indvars.iv.next129.3, %wide.trip.count130.3
  br i1 %exitcond131.3, label %._crit_edge84.us.loopexit, label %.lr.ph87.split.us.new

._crit_edge84.us.loopexit:                        ; preds = %.lr.ph87.split.us.new
  br label %._crit_edge84.us

._crit_edge84.us:                                 ; preds = %._crit_edge84.us.loopexit, %.prol.loopexit133
  %58 = load double, double* %40, align 8
  %59 = fdiv double %58, %2
  store double %59, double* %40, align 8
  %indvars.iv.next138 = add nuw nsw i64 %indvars.iv137, 1
  %exitcond140 = icmp eq i64 %indvars.iv.next138, %wide.trip.count139
  br i1 %exitcond140, label %.preheader64.loopexit, label %.lr.ph87.split.us

.preheader64.loopexit:                            ; preds = %._crit_edge84.us
  br label %.preheader64

.preheader64.loopexit205:                         ; preds = %.lr.ph87.split
  br label %.preheader64

.preheader64:                                     ; preds = %.preheader64.loopexit205, %.preheader64.loopexit, %middle.block, %.lr.ph87.split.prol.loopexit, %6
  %60 = icmp sgt i32 %1, 0
  br i1 %60, label %.preheader63.lr.ph, label %.preheader62

.preheader63.lr.ph:                               ; preds = %.preheader64
  %61 = icmp sgt i32 %0, 0
  br i1 %61, label %.preheader63.us.preheader, label %._crit_edge70

.preheader63.us.preheader:                        ; preds = %.preheader63.lr.ph
  %62 = add i32 %0, -1
  %xtraiter121 = and i32 %0, 3
  %lcmp.mod122 = icmp eq i32 %xtraiter121, 0
  %63 = icmp ult i32 %62, 3
  %wide.trip.count125 = zext i32 %1 to i64
  %wide.trip.count117.3 = zext i32 %0 to i64
  %64 = add nsw i64 %wide.trip.count117.3, -4
  %65 = add nsw i64 %wide.trip.count117.3, -4
  %scevgep180 = getelementptr double, double* %5, i64 4
  br label %.preheader63.us

.preheader63.us:                                  ; preds = %._crit_edge79.us, %.preheader63.us.preheader
  %indvars.iv123 = phi i64 [ 0, %.preheader63.us.preheader ], [ %indvars.iv.next124, %._crit_edge79.us ]
  %scevgep175 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv123, i64 4
  br i1 %lcmp.mod122, label %.prol.loopexit120, label %.prol.preheader119.preheader

.prol.preheader119.preheader:                     ; preds = %.preheader63.us
  br label %.prol.preheader119

.prol.preheader119:                               ; preds = %.prol.preheader119.preheader, %.prol.preheader119
  %indvars.iv115.prol = phi i64 [ %indvars.iv.next116.prol, %.prol.preheader119 ], [ 0, %.prol.preheader119.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader119 ], [ %xtraiter121, %.prol.preheader119.preheader ]
  %66 = getelementptr inbounds double, double* %5, i64 %indvars.iv115.prol
  %67 = load double, double* %66, align 8
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv123, i64 %indvars.iv115.prol
  %69 = load double, double* %68, align 8
  %70 = fsub double %69, %67
  store double %70, double* %68, align 8
  %indvars.iv.next116.prol = add nuw nsw i64 %indvars.iv115.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit120.loopexit, label %.prol.preheader119, !llvm.loop !7

.prol.loopexit120.loopexit:                       ; preds = %.prol.preheader119
  br label %.prol.loopexit120

.prol.loopexit120:                                ; preds = %.prol.loopexit120.loopexit, %.preheader63.us
  %indvars.iv115.unr = phi i64 [ 0, %.preheader63.us ], [ %indvars.iv.next116.prol, %.prol.loopexit120.loopexit ]
  br i1 %63, label %._crit_edge79.us, label %.preheader63.us.new.preheader

.preheader63.us.new.preheader:                    ; preds = %.prol.loopexit120
  %71 = sub i64 %64, %indvars.iv115.unr
  %72 = lshr i64 %71, 2
  %73 = add nuw nsw i64 %72, 1
  %min.iters.check167 = icmp ult i64 %73, 2
  br i1 %min.iters.check167, label %.preheader63.us.new.preheader203, label %min.iters.checked168

min.iters.checked168:                             ; preds = %.preheader63.us.new.preheader
  %n.mod.vf169 = and i64 %73, 1
  %n.vec170 = sub nsw i64 %73, %n.mod.vf169
  %cmp.zero171 = icmp eq i64 %n.vec170, 0
  br i1 %cmp.zero171, label %.preheader63.us.new.preheader203, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked168
  %scevgep173 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv123, i64 %indvars.iv115.unr
  %74 = sub i64 %65, %indvars.iv115.unr
  %75 = and i64 %74, -4
  %76 = add i64 %indvars.iv115.unr, %75
  %scevgep176 = getelementptr double, double* %scevgep175, i64 %76
  %scevgep178 = getelementptr double, double* %5, i64 %indvars.iv115.unr
  %scevgep181 = getelementptr double, double* %scevgep180, i64 %76
  %bound0 = icmp ult double* %scevgep173, %scevgep181
  %bound1 = icmp ult double* %scevgep178, %scevgep176
  %memcheck.conflict = and i1 %bound0, %bound1
  %77 = add i64 %indvars.iv115.unr, 4
  %78 = shl nuw i64 %72, 2
  %79 = add i64 %77, %78
  %80 = shl nuw nsw i64 %n.mod.vf169, 2
  %ind.end187 = sub i64 %79, %80
  br i1 %memcheck.conflict, label %.preheader63.us.new.preheader203, label %vector.body164.preheader

vector.body164.preheader:                         ; preds = %vector.memcheck
  br label %vector.body164

vector.body164:                                   ; preds = %vector.body164.preheader, %vector.body164
  %index184 = phi i64 [ %index.next185, %vector.body164 ], [ 0, %vector.body164.preheader ]
  %81 = shl i64 %index184, 2
  %82 = add i64 %indvars.iv115.unr, %81
  %83 = getelementptr inbounds double, double* %5, i64 %82
  %84 = bitcast double* %83 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %84, align 8, !alias.scope !8
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv123, i64 %82
  %86 = bitcast double* %85 to <8 x double>*
  %wide.vec196 = load <8 x double>, <8 x double>* %86, align 8, !alias.scope !11, !noalias !8
  %87 = fsub <8 x double> %wide.vec196, %wide.vec
  %88 = shufflevector <8 x double> %87, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %89 = fsub <8 x double> %wide.vec196, %wide.vec
  %90 = shufflevector <8 x double> %89, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %91 = fsub <8 x double> %wide.vec196, %wide.vec
  %92 = shufflevector <8 x double> %91, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %93 = add nsw i64 %82, 3
  %94 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv123, i64 %93
  %95 = fsub <8 x double> %wide.vec196, %wide.vec
  %96 = shufflevector <8 x double> %95, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %97 = getelementptr double, double* %94, i64 -3
  %98 = bitcast double* %97 to <8 x double>*
  %99 = shufflevector <2 x double> %88, <2 x double> %90, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %100 = shufflevector <2 x double> %92, <2 x double> %96, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec201 = shufflevector <4 x double> %99, <4 x double> %100, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec201, <8 x double>* %98, align 8, !alias.scope !11, !noalias !8
  %index.next185 = add i64 %index184, 2
  %101 = icmp eq i64 %index.next185, %n.vec170
  br i1 %101, label %middle.block165, label %vector.body164, !llvm.loop !13

middle.block165:                                  ; preds = %vector.body164
  %cmp.n188 = icmp eq i64 %n.mod.vf169, 0
  br i1 %cmp.n188, label %._crit_edge79.us, label %.preheader63.us.new.preheader203

.preheader63.us.new.preheader203:                 ; preds = %middle.block165, %vector.memcheck, %min.iters.checked168, %.preheader63.us.new.preheader
  %indvars.iv115.ph = phi i64 [ %indvars.iv115.unr, %vector.memcheck ], [ %indvars.iv115.unr, %min.iters.checked168 ], [ %indvars.iv115.unr, %.preheader63.us.new.preheader ], [ %ind.end187, %middle.block165 ]
  br label %.preheader63.us.new

.preheader63.us.new:                              ; preds = %.preheader63.us.new.preheader203, %.preheader63.us.new
  %indvars.iv115 = phi i64 [ %indvars.iv.next116.3, %.preheader63.us.new ], [ %indvars.iv115.ph, %.preheader63.us.new.preheader203 ]
  %102 = getelementptr inbounds double, double* %5, i64 %indvars.iv115
  %103 = load double, double* %102, align 8
  %104 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv123, i64 %indvars.iv115
  %105 = load double, double* %104, align 8
  %106 = fsub double %105, %103
  store double %106, double* %104, align 8
  %indvars.iv.next116 = add nuw nsw i64 %indvars.iv115, 1
  %107 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next116
  %108 = load double, double* %107, align 8
  %109 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv123, i64 %indvars.iv.next116
  %110 = load double, double* %109, align 8
  %111 = fsub double %110, %108
  store double %111, double* %109, align 8
  %indvars.iv.next116.1 = add nsw i64 %indvars.iv115, 2
  %112 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next116.1
  %113 = load double, double* %112, align 8
  %114 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv123, i64 %indvars.iv.next116.1
  %115 = load double, double* %114, align 8
  %116 = fsub double %115, %113
  store double %116, double* %114, align 8
  %indvars.iv.next116.2 = add nsw i64 %indvars.iv115, 3
  %117 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next116.2
  %118 = load double, double* %117, align 8
  %119 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv123, i64 %indvars.iv.next116.2
  %120 = load double, double* %119, align 8
  %121 = fsub double %120, %118
  store double %121, double* %119, align 8
  %indvars.iv.next116.3 = add nsw i64 %indvars.iv115, 4
  %exitcond118.3 = icmp eq i64 %indvars.iv.next116.3, %wide.trip.count117.3
  br i1 %exitcond118.3, label %._crit_edge79.us.loopexit, label %.preheader63.us.new, !llvm.loop !14

._crit_edge79.us.loopexit:                        ; preds = %.preheader63.us.new
  br label %._crit_edge79.us

._crit_edge79.us:                                 ; preds = %._crit_edge79.us.loopexit, %middle.block165, %.prol.loopexit120
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %exitcond126 = icmp eq i64 %indvars.iv.next124, %wide.trip.count125
  br i1 %exitcond126, label %.preheader62.loopexit, label %.preheader63.us

.lr.ph87.split:                                   ; preds = %.lr.ph87.split.preheader204, %.lr.ph87.split
  %indvars.iv141 = phi i64 [ %indvars.iv.next142.3, %.lr.ph87.split ], [ %indvars.iv141.ph, %.lr.ph87.split.preheader204 ]
  %122 = getelementptr inbounds double, double* %5, i64 %indvars.iv141
  store double %13, double* %122, align 8
  %indvars.iv.next142 = add nuw nsw i64 %indvars.iv141, 1
  %123 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next142
  store double %14, double* %123, align 8
  %indvars.iv.next142.1 = add nsw i64 %indvars.iv141, 2
  %124 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next142.1
  store double %15, double* %124, align 8
  %indvars.iv.next142.2 = add nsw i64 %indvars.iv141, 3
  %125 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next142.2
  store double %16, double* %125, align 8
  %indvars.iv.next142.3 = add nsw i64 %indvars.iv141, 4
  %exitcond144.3 = icmp eq i64 %indvars.iv.next142.3, %wide.trip.count143.3
  br i1 %exitcond144.3, label %.preheader64.loopexit205, label %.lr.ph87.split, !llvm.loop !15

.preheader62.loopexit:                            ; preds = %._crit_edge79.us
  br label %.preheader62

.preheader62:                                     ; preds = %.preheader62.loopexit, %.preheader64
  %126 = icmp sgt i32 %0, 0
  br i1 %126, label %.preheader.lr.ph, label %._crit_edge70

.preheader.lr.ph:                                 ; preds = %.preheader62
  %127 = icmp sgt i32 %1, 0
  %128 = fadd double %2, -1.000000e+00
  br i1 %127, label %.lr.ph67.us.preheader, label %.preheader.preheader

.lr.ph67.us.preheader:                            ; preds = %.preheader.lr.ph
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %129 = icmp eq i32 %1, 1
  %wide.trip.count95 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %1 to i64
  %wide.trip.count99 = zext i32 %0 to i64
  br label %.lr.ph67.us

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %130 = zext i32 %0 to i64
  %131 = add i32 %0, -1
  %132 = zext i32 %131 to i64
  %wide.trip.count113 = zext i32 %0 to i64
  %133 = fdiv double 0.000000e+00, %128
  %134 = fdiv double 0.000000e+00, %128
  %wide.trip.count105.1 = zext i32 %0 to i64
  %135 = fdiv double 0.000000e+00, %128
  %136 = add nsw i64 %wide.trip.count113, -2
  br label %.lr.ph67

._crit_edge68.us-lcssa.us.us:                     ; preds = %._crit_edge.us.us
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %exitcond100 = icmp eq i64 %indvars.iv.next98, %wide.trip.count99
  br i1 %exitcond100, label %._crit_edge70.loopexit, label %.lr.ph67.us

.lr.ph67.us:                                      ; preds = %.lr.ph67.us.preheader, %._crit_edge68.us-lcssa.us.us
  %indvars.iv97 = phi i64 [ %indvars.iv.next98, %._crit_edge68.us-lcssa.us.us ], [ 0, %.lr.ph67.us.preheader ]
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv97
  br label %.lr.ph.us.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph67.us
  %indvars.iv93 = phi i64 [ %indvars.iv97, %.lr.ph67.us ], [ %indvars.iv.next94, %._crit_edge.us.us ]
  %138 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv97, i64 %indvars.iv93
  store double 0.000000e+00, double* %138, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %139 = load double, double* %137, align 8
  %140 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv93
  %141 = load double, double* %140, align 8
  %142 = fmul double %139, %141
  %143 = load double, double* %138, align 8
  %144 = fadd double %143, %142
  store double %144, double* %138, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %129, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %145 = load double, double* %138, align 8
  %146 = fdiv double %145, %128
  store double %146, double* %138, align 8
  %147 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv93, i64 %indvars.iv97
  store double %146, double* %147, align 8
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  %exitcond = icmp eq i64 %indvars.iv.next94, %wide.trip.count95
  br i1 %exitcond, label %._crit_edge68.us-lcssa.us.us, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %148 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv97
  %149 = load double, double* %148, align 8
  %150 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv93
  %151 = load double, double* %150, align 8
  %152 = fmul double %149, %151
  %153 = load double, double* %138, align 8
  %154 = fadd double %153, %152
  store double %154, double* %138, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %155 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv97
  %156 = load double, double* %155, align 8
  %157 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv93
  %158 = load double, double* %157, align 8
  %159 = fmul double %156, %158
  %160 = load double, double* %138, align 8
  %161 = fadd double %160, %159
  store double %161, double* %138, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph67:                                         ; preds = %.preheader.preheader, %._crit_edge68
  %indvars.iv111 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next112, %._crit_edge68 ]
  %162 = sub i64 %132, %indvars.iv111
  %163 = trunc i64 %162 to i32
  %164 = sub i64 %130, %indvars.iv111
  %xtraiter109148 = and i64 %164, 1
  %lcmp.mod110 = icmp eq i64 %xtraiter109148, 0
  br i1 %lcmp.mod110, label %.prol.loopexit108, label %.prol.preheader107

.prol.preheader107:                               ; preds = %.lr.ph67
  %165 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv111, i64 %indvars.iv111
  store double %135, double* %165, align 8
  %indvars.iv.next104.prol = add nuw nsw i64 %indvars.iv111, 1
  br label %.prol.loopexit108

.prol.loopexit108:                                ; preds = %.prol.preheader107, %.lr.ph67
  %indvars.iv103.unr.ph = phi i64 [ %indvars.iv.next104.prol, %.prol.preheader107 ], [ %indvars.iv111, %.lr.ph67 ]
  %166 = icmp eq i32 %163, 0
  br i1 %166, label %._crit_edge68, label %.lr.ph67.new.preheader

.lr.ph67.new.preheader:                           ; preds = %.prol.loopexit108
  %167 = sub i64 %136, %indvars.iv103.unr.ph
  %168 = lshr i64 %167, 1
  %169 = and i64 %168, 1
  %lcmp.mod207 = icmp eq i64 %169, 0
  br i1 %lcmp.mod207, label %.lr.ph67.new.prol.preheader, label %.lr.ph67.new.prol.loopexit.unr-lcssa

.lr.ph67.new.prol.preheader:                      ; preds = %.lr.ph67.new.preheader
  br label %.lr.ph67.new.prol

.lr.ph67.new.prol:                                ; preds = %.lr.ph67.new.prol.preheader
  %170 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv111, i64 %indvars.iv103.unr.ph
  store double %133, double* %170, align 8
  %171 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv103.unr.ph, i64 %indvars.iv111
  store double %133, double* %171, align 8
  %indvars.iv.next104.prol208 = add nuw nsw i64 %indvars.iv103.unr.ph, 1
  %172 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv111, i64 %indvars.iv.next104.prol208
  store double %134, double* %172, align 8
  %173 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next104.prol208, i64 %indvars.iv111
  store double %134, double* %173, align 8
  %indvars.iv.next104.1.prol = add nsw i64 %indvars.iv103.unr.ph, 2
  br label %.lr.ph67.new.prol.loopexit.unr-lcssa

.lr.ph67.new.prol.loopexit.unr-lcssa:             ; preds = %.lr.ph67.new.preheader, %.lr.ph67.new.prol
  %indvars.iv103.unr.ph209 = phi i64 [ %indvars.iv.next104.1.prol, %.lr.ph67.new.prol ], [ %indvars.iv103.unr.ph, %.lr.ph67.new.preheader ]
  br label %.lr.ph67.new.prol.loopexit

.lr.ph67.new.prol.loopexit:                       ; preds = %.lr.ph67.new.prol.loopexit.unr-lcssa
  %174 = icmp eq i64 %168, 0
  br i1 %174, label %._crit_edge68.loopexit, label %.lr.ph67.new.preheader.new

.lr.ph67.new.preheader.new:                       ; preds = %.lr.ph67.new.prol.loopexit
  br label %.lr.ph67.new

.lr.ph67.new:                                     ; preds = %.lr.ph67.new, %.lr.ph67.new.preheader.new
  %indvars.iv103 = phi i64 [ %indvars.iv103.unr.ph209, %.lr.ph67.new.preheader.new ], [ %indvars.iv.next104.1.1, %.lr.ph67.new ]
  %175 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv111, i64 %indvars.iv103
  store double %133, double* %175, align 8
  %176 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv103, i64 %indvars.iv111
  store double %133, double* %176, align 8
  %indvars.iv.next104 = add nuw nsw i64 %indvars.iv103, 1
  %177 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv111, i64 %indvars.iv.next104
  store double %134, double* %177, align 8
  %178 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next104, i64 %indvars.iv111
  store double %134, double* %178, align 8
  %indvars.iv.next104.1 = add nsw i64 %indvars.iv103, 2
  %179 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv111, i64 %indvars.iv.next104.1
  store double %133, double* %179, align 8
  %180 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next104.1, i64 %indvars.iv111
  store double %133, double* %180, align 8
  %indvars.iv.next104.1210 = add nsw i64 %indvars.iv103, 3
  %181 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv111, i64 %indvars.iv.next104.1210
  store double %134, double* %181, align 8
  %182 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next104.1210, i64 %indvars.iv111
  store double %134, double* %182, align 8
  %indvars.iv.next104.1.1 = add nsw i64 %indvars.iv103, 4
  %exitcond106.1.1 = icmp eq i64 %indvars.iv.next104.1.1, %wide.trip.count105.1
  br i1 %exitcond106.1.1, label %._crit_edge68.loopexit.unr-lcssa, label %.lr.ph67.new

._crit_edge68.loopexit.unr-lcssa:                 ; preds = %.lr.ph67.new
  br label %._crit_edge68.loopexit

._crit_edge68.loopexit:                           ; preds = %.lr.ph67.new.prol.loopexit, %._crit_edge68.loopexit.unr-lcssa
  br label %._crit_edge68

._crit_edge68:                                    ; preds = %._crit_edge68.loopexit, %.prol.loopexit108
  %indvars.iv.next112 = add nuw nsw i64 %indvars.iv111, 1
  %exitcond114 = icmp eq i64 %indvars.iv.next112, %wide.trip.count113
  br i1 %exitcond114, label %._crit_edge70.loopexit202, label %.lr.ph67

._crit_edge70.loopexit:                           ; preds = %._crit_edge68.us-lcssa.us.us
  br label %._crit_edge70

._crit_edge70.loopexit202:                        ; preds = %._crit_edge68
  br label %._crit_edge70

._crit_edge70:                                    ; preds = %._crit_edge70.loopexit202, %._crit_edge70.loopexit, %.preheader63.lr.ph, %.preheader62
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [1200 x double]*) #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge13

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count16 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv14 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next15, %._crit_edge.us ]
  %9 = mul nsw i64 %indvars.iv14, %8
  br label %10

; <label>:10:                                     ; preds = %17, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %17 ]
  %11 = add nsw i64 %indvars.iv, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %17

; <label>:17:                                     ; preds = %15, %10
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv14, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %10

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next15, %wide.trip.count16
  br i1 %exitcond17, label %._crit_edge13.loopexit, label %.preheader.us

._crit_edge13.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %2
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #5
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

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
!6 = distinct !{!6, !2}
!7 = distinct !{!7, !2}
!8 = !{!9}
!9 = distinct !{!9, !10}
!10 = distinct !{!10, !"LVerDomain"}
!11 = !{!12}
!12 = distinct !{!12, !10}
!13 = distinct !{!13, !4, !5}
!14 = distinct !{!14, !4, !5}
!15 = distinct !{!15, !16, !4, !5}
!16 = !{!"llvm.loop.unroll.runtime.disable"}
