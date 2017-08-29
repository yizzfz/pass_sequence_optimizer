; ModuleID = 'A.ll'
source_filename = "covariance.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"cov\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %7 = bitcast i8* %4 to [1200 x double]*
  call fastcc void @init_array(i32 1200, i32 1400, double* nonnull %3, [1200 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  call fastcc void @kernel_covariance(i32 1200, i32 1400, double %8, [1200 x double]* %7, [1200 x double]* %9, double* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  call fastcc void @print_array(i32 1200, [1200 x double]* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  %5 = sitofp i32 %1 to double
  store double %5, double* %2, align 8
  br label %.preheader

.preheader:                                       ; preds = %18, %4
  %indvars.iv13 = phi i64 [ 0, %4 ], [ %indvars.iv.next14, %18 ]
  %6 = trunc i64 %indvars.iv13 to i32
  %7 = sitofp i32 %6 to double
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %._crit_edge ]
  %8 = trunc i64 %indvars.iv to i32
  %9 = sitofp i32 %8 to double
  %10 = fmul double %7, %9
  %11 = fdiv double %10, 1.200000e+03
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv13, i64 %indvars.iv
  store double %11, double* %12, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %13 = trunc i64 %indvars.iv.next to i32
  %14 = sitofp i32 %13 to double
  %15 = fmul double %7, %14
  %16 = fdiv double %15, 1.200000e+03
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv13, i64 %indvars.iv.next
  store double %16, double* %17, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %18, label %._crit_edge

; <label>:18:                                     ; preds = %._crit_edge
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next14, 1400
  br i1 %exitcond, label %19, label %.preheader

; <label>:19:                                     ; preds = %18
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_covariance(i32, i32, double, [1200 x double]*, [1200 x double]* nocapture, double*) unnamed_addr #2 {
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
  %11 = add nsw i32 %xtraiter145, -1
  br label %.lr.ph87.split.prol

.lr.ph87.split.prol:                              ; preds = %.lr.ph87.split.prol..lr.ph87.split.prol_crit_edge, %.lr.ph87.split.prol.preheader
  %indvars.iv141.prol = phi i64 [ %indvars.iv.next142.prol, %.lr.ph87.split.prol..lr.ph87.split.prol_crit_edge ], [ 0, %.lr.ph87.split.prol.preheader ]
  %prol.iter147 = phi i32 [ %prol.iter147.sub, %.lr.ph87.split.prol..lr.ph87.split.prol_crit_edge ], [ %xtraiter145, %.lr.ph87.split.prol.preheader ]
  %12 = getelementptr inbounds double, double* %5, i64 %indvars.iv141.prol
  store double %10, double* %12, align 8
  %prol.iter147.sub = add nsw i32 %prol.iter147, -1
  %prol.iter147.cmp = icmp eq i32 %prol.iter147.sub, 0
  br i1 %prol.iter147.cmp, label %.lr.ph87.split.prol.loopexit.loopexit, label %.lr.ph87.split.prol..lr.ph87.split.prol_crit_edge, !llvm.loop !1

.lr.ph87.split.prol..lr.ph87.split.prol_crit_edge: ; preds = %.lr.ph87.split.prol
  %indvars.iv.next142.prol = add nuw nsw i64 %indvars.iv141.prol, 1
  br label %.lr.ph87.split.prol

.lr.ph87.split.prol.loopexit.loopexit:            ; preds = %.lr.ph87.split.prol
  %13 = zext i32 %11 to i64
  %14 = add nuw nsw i64 %13, 1
  br label %.lr.ph87.split.prol.loopexit

.lr.ph87.split.prol.loopexit:                     ; preds = %.lr.ph87.split.preheader, %.lr.ph87.split.prol.loopexit.loopexit
  %indvars.iv141.unr = phi i64 [ %14, %.lr.ph87.split.prol.loopexit.loopexit ], [ 0, %.lr.ph87.split.preheader ]
  %15 = icmp ult i32 %9, 3
  br i1 %15, label %.preheader64, label %.lr.ph87.split.preheader150

.lr.ph87.split.preheader150:                      ; preds = %.lr.ph87.split.prol.loopexit
  %16 = fdiv double 0.000000e+00, %2
  %wide.trip.count143.3 = zext i32 %0 to i64
  %17 = add nsw i64 %wide.trip.count143.3, -4
  %18 = sub nsw i64 %17, %indvars.iv141.unr
  %19 = lshr i64 %18, 2
  %20 = add nuw nsw i64 %19, 1
  %min.iters.check = icmp ult i64 %20, 4
  br i1 %min.iters.check, label %.lr.ph87.split.preheader200, label %min.iters.checked

.lr.ph87.split.preheader200:                      ; preds = %middle.block, %min.iters.checked, %.lr.ph87.split.preheader150
  %indvars.iv141.ph = phi i64 [ %ind.end, %middle.block ], [ %indvars.iv141.unr, %min.iters.checked ], [ %indvars.iv141.unr, %.lr.ph87.split.preheader150 ]
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
  br i1 %cmp.zero, label %.lr.ph87.split.preheader200, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert157 = insertelement <2 x double> undef, double %16, i32 0
  %interleaved.vec = shufflevector <2 x double> %broadcast.splatinsert157, <2 x double> undef, <8 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %25 = shl i64 %index, 2
  %offset.idx = add i64 %indvars.iv141.unr, %25
  %26 = add i64 %indvars.iv141.unr, %25
  %27 = add nsw i64 %26, 3
  %28 = add i64 %offset.idx, 11
  %29 = getelementptr inbounds double, double* %5, i64 %27
  %30 = getelementptr inbounds double, double* %5, i64 %28
  %31 = getelementptr double, double* %29, i64 -3
  %32 = bitcast double* %31 to <8 x double>*
  %33 = getelementptr double, double* %30, i64 -3
  %34 = bitcast double* %33 to <8 x double>*
  store <8 x double> %interleaved.vec, <8 x double>* %32, align 8
  store <8 x double> %interleaved.vec, <8 x double>* %34, align 8
  %index.next = add i64 %index, 4
  %35 = icmp eq i64 %index.next, %n.vec
  br i1 %35, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.preheader64, label %.lr.ph87.split.preheader200

.lr.ph87.split.us.preheader:                      ; preds = %.lr.ph87
  %36 = add i32 %1, -1
  %xtraiter134 = and i32 %1, 3
  %lcmp.mod135 = icmp eq i32 %xtraiter134, 0
  %37 = icmp ult i32 %36, 3
  %wide.trip.count139 = zext i32 %0 to i64
  %wide.trip.count130.3 = zext i32 %1 to i64
  %38 = add nsw i32 %xtraiter134, -1
  %39 = zext i32 %38 to i64
  %40 = add nuw nsw i64 %39, 1
  br label %.lr.ph87.split.us

.lr.ph87.split.us:                                ; preds = %._crit_edge84.us, %.lr.ph87.split.us.preheader
  %indvars.iv137 = phi i64 [ 0, %.lr.ph87.split.us.preheader ], [ %indvars.iv.next138, %._crit_edge84.us ]
  %41 = getelementptr inbounds double, double* %5, i64 %indvars.iv137
  store double 0.000000e+00, double* %41, align 8
  br i1 %lcmp.mod135, label %.prol.loopexit133, label %.prol.preheader132.preheader

.prol.preheader132.preheader:                     ; preds = %.lr.ph87.split.us
  br label %.prol.preheader132

.prol.preheader132:                               ; preds = %.prol.preheader132.preheader, %.prol.preheader132..prol.preheader132_crit_edge
  %42 = phi double [ %45, %.prol.preheader132..prol.preheader132_crit_edge ], [ 0.000000e+00, %.prol.preheader132.preheader ]
  %indvars.iv128.prol = phi i64 [ %indvars.iv.next129.prol, %.prol.preheader132..prol.preheader132_crit_edge ], [ 0, %.prol.preheader132.preheader ]
  %prol.iter136 = phi i32 [ %prol.iter136.sub, %.prol.preheader132..prol.preheader132_crit_edge ], [ %xtraiter134, %.prol.preheader132.preheader ]
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv128.prol, i64 %indvars.iv137
  %44 = load double, double* %43, align 8
  %45 = fadd double %44, %42
  store double %45, double* %41, align 8
  %prol.iter136.sub = add nsw i32 %prol.iter136, -1
  %prol.iter136.cmp = icmp eq i32 %prol.iter136.sub, 0
  br i1 %prol.iter136.cmp, label %.prol.loopexit133.loopexit, label %.prol.preheader132..prol.preheader132_crit_edge, !llvm.loop !6

.prol.preheader132..prol.preheader132_crit_edge:  ; preds = %.prol.preheader132
  %indvars.iv.next129.prol = add nuw nsw i64 %indvars.iv128.prol, 1
  br label %.prol.preheader132

.prol.loopexit133.loopexit:                       ; preds = %.prol.preheader132
  br label %.prol.loopexit133

.prol.loopexit133:                                ; preds = %.prol.loopexit133.loopexit, %.lr.ph87.split.us
  %46 = phi double [ 0.000000e+00, %.lr.ph87.split.us ], [ %45, %.prol.loopexit133.loopexit ]
  %indvars.iv128.unr = phi i64 [ 0, %.lr.ph87.split.us ], [ %40, %.prol.loopexit133.loopexit ]
  br i1 %37, label %._crit_edge84.us, label %.lr.ph87.split.us.new.preheader

.lr.ph87.split.us.new.preheader:                  ; preds = %.prol.loopexit133
  br label %.lr.ph87.split.us.new

.lr.ph87.split.us.new:                            ; preds = %.lr.ph87.split.us.new.preheader, %.lr.ph87.split.us.new
  %47 = phi double [ %59, %.lr.ph87.split.us.new ], [ %46, %.lr.ph87.split.us.new.preheader ]
  %indvars.iv128 = phi i64 [ %indvars.iv.next129.3, %.lr.ph87.split.us.new ], [ %indvars.iv128.unr, %.lr.ph87.split.us.new.preheader ]
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv128, i64 %indvars.iv137
  %49 = load double, double* %48, align 8
  %50 = fadd double %49, %47
  store double %50, double* %41, align 8
  %indvars.iv.next129 = add nuw nsw i64 %indvars.iv128, 1
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next129, i64 %indvars.iv137
  %52 = load double, double* %51, align 8
  %53 = fadd double %52, %50
  store double %53, double* %41, align 8
  %indvars.iv.next129.1 = add nsw i64 %indvars.iv128, 2
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next129.1, i64 %indvars.iv137
  %55 = load double, double* %54, align 8
  %56 = fadd double %55, %53
  store double %56, double* %41, align 8
  %indvars.iv.next129.2 = add nsw i64 %indvars.iv128, 3
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next129.2, i64 %indvars.iv137
  %58 = load double, double* %57, align 8
  %59 = fadd double %58, %56
  store double %59, double* %41, align 8
  %indvars.iv.next129.3 = add nsw i64 %indvars.iv128, 4
  %exitcond131.3 = icmp eq i64 %indvars.iv.next129.3, %wide.trip.count130.3
  br i1 %exitcond131.3, label %._crit_edge84.us.loopexit, label %.lr.ph87.split.us.new

._crit_edge84.us.loopexit:                        ; preds = %.lr.ph87.split.us.new
  br label %._crit_edge84.us

._crit_edge84.us:                                 ; preds = %._crit_edge84.us.loopexit, %.prol.loopexit133
  %60 = phi double [ %46, %.prol.loopexit133 ], [ %59, %._crit_edge84.us.loopexit ]
  %61 = fdiv double %60, %2
  store double %61, double* %41, align 8
  %indvars.iv.next138 = add nuw nsw i64 %indvars.iv137, 1
  %exitcond140 = icmp eq i64 %indvars.iv.next138, %wide.trip.count139
  br i1 %exitcond140, label %.preheader64.loopexit, label %.lr.ph87.split.us

.preheader64.loopexit:                            ; preds = %._crit_edge84.us
  br label %.preheader64

.preheader64.loopexit201:                         ; preds = %.lr.ph87.split
  br label %.preheader64

.preheader64:                                     ; preds = %.preheader64.loopexit201, %.preheader64.loopexit, %middle.block, %.lr.ph87.split.prol.loopexit, %6
  %62 = icmp sgt i32 %1, 0
  br i1 %62, label %.preheader63.lr.ph, label %.preheader62

.preheader63.lr.ph:                               ; preds = %.preheader64
  br i1 %7, label %.preheader63.us.preheader, label %._crit_edge70

.preheader63.us.preheader:                        ; preds = %.preheader63.lr.ph
  %63 = add i32 %0, -1
  %xtraiter121 = and i32 %0, 3
  %lcmp.mod122 = icmp eq i32 %xtraiter121, 0
  %64 = icmp ult i32 %63, 3
  %wide.trip.count125 = zext i32 %1 to i64
  %wide.trip.count117.3 = zext i32 %0 to i64
  %65 = add nsw i32 %xtraiter121, -1
  %66 = zext i32 %65 to i64
  %67 = add nuw nsw i64 %66, 1
  %68 = add nsw i64 %wide.trip.count117.3, -4
  %69 = add nsw i64 %wide.trip.count117.3, -4
  %scevgep176 = getelementptr double, double* %5, i64 4
  br label %.preheader63.us

.preheader63.us:                                  ; preds = %._crit_edge79.us, %.preheader63.us.preheader
  %indvars.iv123 = phi i64 [ 0, %.preheader63.us.preheader ], [ %indvars.iv.next124, %._crit_edge79.us ]
  %scevgep171 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv123, i64 4
  br i1 %lcmp.mod122, label %.prol.loopexit120, label %.prol.preheader119.preheader

.prol.preheader119.preheader:                     ; preds = %.preheader63.us
  br label %.prol.preheader119

.prol.preheader119:                               ; preds = %.prol.preheader119.preheader, %.prol.preheader119..prol.preheader119_crit_edge
  %indvars.iv115.prol = phi i64 [ %indvars.iv.next116.prol, %.prol.preheader119..prol.preheader119_crit_edge ], [ 0, %.prol.preheader119.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader119..prol.preheader119_crit_edge ], [ %xtraiter121, %.prol.preheader119.preheader ]
  %70 = getelementptr inbounds double, double* %5, i64 %indvars.iv115.prol
  %71 = load double, double* %70, align 8
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv123, i64 %indvars.iv115.prol
  %73 = load double, double* %72, align 8
  %74 = fsub double %73, %71
  store double %74, double* %72, align 8
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit120.loopexit, label %.prol.preheader119..prol.preheader119_crit_edge, !llvm.loop !7

.prol.preheader119..prol.preheader119_crit_edge:  ; preds = %.prol.preheader119
  %indvars.iv.next116.prol = add nuw nsw i64 %indvars.iv115.prol, 1
  br label %.prol.preheader119

.prol.loopexit120.loopexit:                       ; preds = %.prol.preheader119
  br label %.prol.loopexit120

.prol.loopexit120:                                ; preds = %.prol.loopexit120.loopexit, %.preheader63.us
  %indvars.iv115.unr = phi i64 [ 0, %.preheader63.us ], [ %67, %.prol.loopexit120.loopexit ]
  br i1 %64, label %._crit_edge79.us, label %.preheader63.us.new.preheader

.preheader63.us.new.preheader:                    ; preds = %.prol.loopexit120
  %75 = sub nsw i64 %68, %indvars.iv115.unr
  %76 = lshr i64 %75, 2
  %77 = add nuw nsw i64 %76, 1
  %min.iters.check163 = icmp ult i64 %77, 2
  br i1 %min.iters.check163, label %.preheader63.us.new.preheader199, label %min.iters.checked164

min.iters.checked164:                             ; preds = %.preheader63.us.new.preheader
  %n.mod.vf165 = and i64 %77, 1
  %n.vec166 = sub nsw i64 %77, %n.mod.vf165
  %cmp.zero167 = icmp eq i64 %n.vec166, 0
  br i1 %cmp.zero167, label %.preheader63.us.new.preheader199, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked164
  %scevgep169 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv123, i64 %indvars.iv115.unr
  %78 = sub nsw i64 %69, %indvars.iv115.unr
  %79 = and i64 %78, -4
  %80 = add nsw i64 %indvars.iv115.unr, %79
  %scevgep172 = getelementptr double, double* %scevgep171, i64 %80
  %scevgep174 = getelementptr double, double* %5, i64 %indvars.iv115.unr
  %scevgep177 = getelementptr double, double* %scevgep176, i64 %80
  %bound0 = icmp ult double* %scevgep169, %scevgep177
  %bound1 = icmp ult double* %scevgep174, %scevgep172
  %memcheck.conflict = and i1 %bound0, %bound1
  %81 = add nsw i64 %indvars.iv115.unr, 4
  %82 = shl nuw i64 %76, 2
  %83 = add i64 %81, %82
  %84 = shl nuw nsw i64 %n.mod.vf165, 2
  %ind.end183 = sub i64 %83, %84
  br i1 %memcheck.conflict, label %.preheader63.us.new.preheader199, label %vector.body160.preheader

vector.body160.preheader:                         ; preds = %vector.memcheck
  br label %vector.body160

vector.body160:                                   ; preds = %vector.body160.preheader, %vector.body160
  %index180 = phi i64 [ %index.next181, %vector.body160 ], [ 0, %vector.body160.preheader ]
  %85 = shl i64 %index180, 2
  %86 = add i64 %indvars.iv115.unr, %85
  %87 = getelementptr inbounds double, double* %5, i64 %86
  %88 = bitcast double* %87 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %88, align 8, !alias.scope !8
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv123, i64 %86
  %90 = bitcast double* %89 to <8 x double>*
  %wide.vec192 = load <8 x double>, <8 x double>* %90, align 8, !alias.scope !11, !noalias !8
  %91 = fsub <8 x double> %wide.vec192, %wide.vec
  %92 = shufflevector <8 x double> %91, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %93 = fsub <8 x double> %wide.vec192, %wide.vec
  %94 = shufflevector <8 x double> %93, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %95 = fsub <8 x double> %wide.vec192, %wide.vec
  %96 = shufflevector <8 x double> %95, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %97 = add nsw i64 %86, 3
  %98 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv123, i64 %97
  %99 = fsub <8 x double> %wide.vec192, %wide.vec
  %100 = shufflevector <8 x double> %99, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %101 = getelementptr double, double* %98, i64 -3
  %102 = bitcast double* %101 to <8 x double>*
  %103 = shufflevector <2 x double> %92, <2 x double> %94, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %104 = shufflevector <2 x double> %96, <2 x double> %100, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec197 = shufflevector <4 x double> %103, <4 x double> %104, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec197, <8 x double>* %102, align 8, !alias.scope !11, !noalias !8
  %index.next181 = add i64 %index180, 2
  %105 = icmp eq i64 %index.next181, %n.vec166
  br i1 %105, label %middle.block161, label %vector.body160, !llvm.loop !13

middle.block161:                                  ; preds = %vector.body160
  %cmp.n184 = icmp eq i64 %n.mod.vf165, 0
  br i1 %cmp.n184, label %._crit_edge79.us, label %.preheader63.us.new.preheader199

.preheader63.us.new.preheader199:                 ; preds = %middle.block161, %vector.memcheck, %min.iters.checked164, %.preheader63.us.new.preheader
  %indvars.iv115.ph = phi i64 [ %ind.end183, %middle.block161 ], [ %indvars.iv115.unr, %vector.memcheck ], [ %indvars.iv115.unr, %min.iters.checked164 ], [ %indvars.iv115.unr, %.preheader63.us.new.preheader ]
  br label %.preheader63.us.new

.preheader63.us.new:                              ; preds = %.preheader63.us.new.preheader199, %.preheader63.us.new
  %indvars.iv115 = phi i64 [ %indvars.iv.next116.3, %.preheader63.us.new ], [ %indvars.iv115.ph, %.preheader63.us.new.preheader199 ]
  %106 = getelementptr inbounds double, double* %5, i64 %indvars.iv115
  %107 = load double, double* %106, align 8
  %108 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv123, i64 %indvars.iv115
  %109 = load double, double* %108, align 8
  %110 = fsub double %109, %107
  store double %110, double* %108, align 8
  %indvars.iv.next116 = add nuw nsw i64 %indvars.iv115, 1
  %111 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next116
  %112 = load double, double* %111, align 8
  %113 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv123, i64 %indvars.iv.next116
  %114 = load double, double* %113, align 8
  %115 = fsub double %114, %112
  store double %115, double* %113, align 8
  %indvars.iv.next116.1 = add nsw i64 %indvars.iv115, 2
  %116 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next116.1
  %117 = load double, double* %116, align 8
  %118 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv123, i64 %indvars.iv.next116.1
  %119 = load double, double* %118, align 8
  %120 = fsub double %119, %117
  store double %120, double* %118, align 8
  %indvars.iv.next116.2 = add nsw i64 %indvars.iv115, 3
  %121 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next116.2
  %122 = load double, double* %121, align 8
  %123 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv123, i64 %indvars.iv.next116.2
  %124 = load double, double* %123, align 8
  %125 = fsub double %124, %122
  store double %125, double* %123, align 8
  %indvars.iv.next116.3 = add nsw i64 %indvars.iv115, 4
  %exitcond118.3 = icmp eq i64 %indvars.iv.next116.3, %wide.trip.count117.3
  br i1 %exitcond118.3, label %._crit_edge79.us.loopexit, label %.preheader63.us.new, !llvm.loop !14

._crit_edge79.us.loopexit:                        ; preds = %.preheader63.us.new
  br label %._crit_edge79.us

._crit_edge79.us:                                 ; preds = %._crit_edge79.us.loopexit, %middle.block161, %.prol.loopexit120
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %exitcond126 = icmp eq i64 %indvars.iv.next124, %wide.trip.count125
  br i1 %exitcond126, label %.preheader62.loopexit, label %.preheader63.us

.lr.ph87.split:                                   ; preds = %.lr.ph87.split.preheader200, %.lr.ph87.split
  %indvars.iv141 = phi i64 [ %indvars.iv.next142.3, %.lr.ph87.split ], [ %indvars.iv141.ph, %.lr.ph87.split.preheader200 ]
  %126 = getelementptr inbounds double, double* %5, i64 %indvars.iv141
  store double %16, double* %126, align 8
  %indvars.iv.next142 = add nuw nsw i64 %indvars.iv141, 1
  %127 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next142
  store double %16, double* %127, align 8
  %indvars.iv.next142.1 = add nsw i64 %indvars.iv141, 2
  %128 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next142.1
  store double %16, double* %128, align 8
  %indvars.iv.next142.2 = add nsw i64 %indvars.iv141, 3
  %129 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next142.2
  store double %16, double* %129, align 8
  %indvars.iv.next142.3 = add nsw i64 %indvars.iv141, 4
  %exitcond144.3 = icmp eq i64 %indvars.iv.next142.3, %wide.trip.count143.3
  br i1 %exitcond144.3, label %.preheader64.loopexit201, label %.lr.ph87.split, !llvm.loop !15

.preheader62.loopexit:                            ; preds = %._crit_edge79.us
  br label %.preheader62

.preheader62:                                     ; preds = %.preheader62.loopexit, %.preheader64
  br i1 %7, label %.preheader.lr.ph, label %._crit_edge70

.preheader.lr.ph:                                 ; preds = %.preheader62
  %130 = fadd double %2, -1.000000e+00
  br i1 %62, label %.lr.ph67.us.preheader, label %.preheader.preheader

.lr.ph67.us.preheader:                            ; preds = %.preheader.lr.ph
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %131 = icmp eq i32 %1, 1
  %wide.trip.count95 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %1 to i64
  br label %.lr.ph67.us

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %132 = zext i32 %0 to i64
  %133 = add i32 %0, -1
  %134 = zext i32 %133 to i64
  %135 = fdiv double 0.000000e+00, %130
  %136 = add nsw i64 %132, -2
  br label %.lr.ph67

._crit_edge68.us-lcssa.us.us:                     ; preds = %._crit_edge.us.us
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %exitcond100 = icmp eq i64 %indvars.iv.next98, %wide.trip.count95
  br i1 %exitcond100, label %._crit_edge70.loopexit, label %.lr.ph67.us

.lr.ph67.us:                                      ; preds = %._crit_edge68.us-lcssa.us.us, %.lr.ph67.us.preheader
  %indvars.iv97 = phi i64 [ 0, %.lr.ph67.us.preheader ], [ %indvars.iv.next98, %._crit_edge68.us-lcssa.us.us ]
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
  %143 = fadd double %142, 0.000000e+00
  store double %143, double* %138, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us.us, %.prol.preheader
  %144 = phi double [ %143, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %131, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %145 = phi double [ %144, %.prol.loopexit ], [ %160, %._crit_edge.us.us.loopexit ]
  %146 = fdiv double %145, %130
  store double %146, double* %138, align 8
  %147 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv93, i64 %indvars.iv97
  store double %146, double* %147, align 8
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  %exitcond = icmp eq i64 %indvars.iv.next94, %wide.trip.count95
  br i1 %exitcond, label %._crit_edge68.us-lcssa.us.us, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %148 = phi double [ %160, %.lr.ph.us.us.new ], [ %144, %.lr.ph.us.us.new.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %149 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv97
  %150 = load double, double* %149, align 8
  %151 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv93
  %152 = load double, double* %151, align 8
  %153 = fmul double %150, %152
  %154 = fadd double %148, %153
  store double %154, double* %138, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %155 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv97
  %156 = load double, double* %155, align 8
  %157 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv93
  %158 = load double, double* %157, align 8
  %159 = fmul double %156, %158
  %160 = fadd double %154, %159
  store double %160, double* %138, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph67:                                         ; preds = %._crit_edge68, %.preheader.preheader
  %indvars.iv111 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next112, %._crit_edge68 ]
  %161 = sub i64 %134, %indvars.iv111
  %162 = trunc i64 %161 to i32
  %163 = sub i64 %132, %indvars.iv111
  %xtraiter109148 = and i64 %163, 1
  %lcmp.mod110 = icmp eq i64 %xtraiter109148, 0
  br i1 %lcmp.mod110, label %.prol.loopexit108, label %.prol.preheader107

.prol.preheader107:                               ; preds = %.lr.ph67
  %164 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv111, i64 %indvars.iv111
  store double %135, double* %164, align 8
  %indvars.iv.next104.prol = add nuw nsw i64 %indvars.iv111, 1
  br label %.prol.loopexit108

.prol.loopexit108:                                ; preds = %.lr.ph67, %.prol.preheader107
  %indvars.iv103.unr.ph = phi i64 [ %indvars.iv.next104.prol, %.prol.preheader107 ], [ %indvars.iv111, %.lr.ph67 ]
  %165 = icmp eq i32 %162, 0
  br i1 %165, label %._crit_edge68, label %.lr.ph67.new.preheader

.lr.ph67.new.preheader:                           ; preds = %.prol.loopexit108
  %166 = sub i64 %136, %indvars.iv103.unr.ph
  %167 = lshr i64 %166, 1
  %168 = and i64 %167, 1
  %lcmp.mod205 = icmp eq i64 %168, 0
  br i1 %lcmp.mod205, label %.lr.ph67.new.prol.preheader, label %.lr.ph67.new.prol.loopexit.unr-lcssa

.lr.ph67.new.prol.preheader:                      ; preds = %.lr.ph67.new.preheader
  br label %.lr.ph67.new.prol

.lr.ph67.new.prol:                                ; preds = %.lr.ph67.new.prol.preheader
  %169 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv111, i64 %indvars.iv103.unr.ph
  store double %135, double* %169, align 8
  %170 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv103.unr.ph, i64 %indvars.iv111
  store double %135, double* %170, align 8
  %indvars.iv.next104.prol206 = add nuw nsw i64 %indvars.iv103.unr.ph, 1
  %171 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv111, i64 %indvars.iv.next104.prol206
  store double %135, double* %171, align 8
  %172 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next104.prol206, i64 %indvars.iv111
  store double %135, double* %172, align 8
  %indvars.iv.next104.1.prol = add nsw i64 %indvars.iv103.unr.ph, 2
  br label %.lr.ph67.new.prol.loopexit.unr-lcssa

.lr.ph67.new.prol.loopexit.unr-lcssa:             ; preds = %.lr.ph67.new.preheader, %.lr.ph67.new.prol
  %indvars.iv103.unr.ph207 = phi i64 [ %indvars.iv.next104.1.prol, %.lr.ph67.new.prol ], [ %indvars.iv103.unr.ph, %.lr.ph67.new.preheader ]
  br label %.lr.ph67.new.prol.loopexit

.lr.ph67.new.prol.loopexit:                       ; preds = %.lr.ph67.new.prol.loopexit.unr-lcssa
  %173 = icmp eq i64 %167, 0
  br i1 %173, label %._crit_edge68.loopexit, label %.lr.ph67.new.preheader.new

.lr.ph67.new.preheader.new:                       ; preds = %.lr.ph67.new.prol.loopexit
  br label %.lr.ph67.new

.lr.ph67.new:                                     ; preds = %.lr.ph67.new, %.lr.ph67.new.preheader.new
  %indvars.iv103 = phi i64 [ %indvars.iv103.unr.ph207, %.lr.ph67.new.preheader.new ], [ %indvars.iv.next104.1.1, %.lr.ph67.new ]
  %174 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv111, i64 %indvars.iv103
  store double %135, double* %174, align 8
  %175 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv103, i64 %indvars.iv111
  store double %135, double* %175, align 8
  %indvars.iv.next104 = add nuw nsw i64 %indvars.iv103, 1
  %176 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv111, i64 %indvars.iv.next104
  store double %135, double* %176, align 8
  %177 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next104, i64 %indvars.iv111
  store double %135, double* %177, align 8
  %indvars.iv.next104.1 = add nsw i64 %indvars.iv103, 2
  %178 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv111, i64 %indvars.iv.next104.1
  store double %135, double* %178, align 8
  %179 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next104.1, i64 %indvars.iv111
  store double %135, double* %179, align 8
  %indvars.iv.next104.1208 = add nsw i64 %indvars.iv103, 3
  %180 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv111, i64 %indvars.iv.next104.1208
  store double %135, double* %180, align 8
  %181 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next104.1208, i64 %indvars.iv111
  store double %135, double* %181, align 8
  %indvars.iv.next104.1.1 = add nsw i64 %indvars.iv103, 4
  %exitcond106.1.1 = icmp eq i64 %indvars.iv.next104.1.1, %132
  br i1 %exitcond106.1.1, label %._crit_edge68.loopexit.unr-lcssa, label %.lr.ph67.new

._crit_edge68.loopexit.unr-lcssa:                 ; preds = %.lr.ph67.new
  br label %._crit_edge68.loopexit

._crit_edge68.loopexit:                           ; preds = %.lr.ph67.new.prol.loopexit, %._crit_edge68.loopexit.unr-lcssa
  br label %._crit_edge68

._crit_edge68:                                    ; preds = %._crit_edge68.loopexit, %.prol.loopexit108
  %indvars.iv.next112 = add nuw nsw i64 %indvars.iv111, 1
  %exitcond114 = icmp eq i64 %indvars.iv.next112, %132
  br i1 %exitcond114, label %._crit_edge70.loopexit198, label %.lr.ph67

._crit_edge70.loopexit:                           ; preds = %._crit_edge68.us-lcssa.us.us
  br label %._crit_edge70

._crit_edge70.loopexit198:                        ; preds = %._crit_edge68
  br label %._crit_edge70

._crit_edge70:                                    ; preds = %._crit_edge70.loopexit198, %._crit_edge70.loopexit, %.preheader62, %.preheader63.lr.ph
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge14

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv15 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next16, %._crit_edge.us ]
  %9 = mul nsw i64 %indvars.iv15, %8
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %10 = add nsw i64 %indvars.iv, %9
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %._crit_edge19
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge19, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge19

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next16, %wide.trip.count
  br i1 %exitcond18, label %._crit_edge14.loopexit, label %.preheader.us

._crit_edge14.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %2
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
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
