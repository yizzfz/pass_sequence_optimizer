; ModuleID = 'preprocess.2.ll'
source_filename = "preprocess.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.gsm_state = type { [280 x i16], i16, i64, i32, [8 x i16], [2 x [8 x i16]], i16, i16, [9 x i16], i16, i8, i8 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [14 x i8] c"SO >= -0x4000\00", align 1
@.str.1 = private unnamed_addr constant [13 x i8] c"preprocess.c\00", align 1
@__PRETTY_FUNCTION__.Gsm_Preprocess = private unnamed_addr constant [56 x i8] c"void Gsm_Preprocess(struct gsm_state *, word *, word *)\00", align 1
@.str.2 = private unnamed_addr constant [13 x i8] c"SO <= 0x3FFC\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"s1 != MIN_WORD\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_Gsm_Preprocess = private constant [14 x i8] c"Gsm_Preprocess"
@__profc_Gsm_Preprocess = private global [14 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_Gsm_Preprocess = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6477549357404847806, i64 72057823744758033, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_Gsm_Preprocess, i32 0, i32 0), i8* bitcast (void (%struct.gsm_state*, i16*, i16*)* @Gsm_Preprocess to i8*), i8* null, i32 14, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [16 x i8] c"\0E\00Gsm_Preprocess", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_Gsm_Preprocess to i8*), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @Gsm_Preprocess(%struct.gsm_state*, i16*, i16*) #0 {
  %4 = alloca %struct.gsm_state*, align 8
  %5 = alloca i16*, align 8
  %6 = alloca i16*, align 8
  %7 = alloca i16, align 2
  %8 = alloca i64, align 8
  %9 = alloca i16, align 2
  %10 = alloca i16, align 2
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  %13 = alloca i16, align 2
  %14 = alloca i16, align 2
  %15 = alloca i16, align 2
  %16 = alloca i64, align 8
  %17 = alloca i64, align 8
  %18 = alloca i32, align 4
  store %struct.gsm_state* %0, %struct.gsm_state** %4, align 8
  store i16* %1, i16** %5, align 8
  store i16* %2, i16** %6, align 8
  %19 = load %struct.gsm_state*, %struct.gsm_state** %4, align 8
  %20 = getelementptr inbounds %struct.gsm_state, %struct.gsm_state* %19, i32 0, i32 1
  %21 = load i16, i16* %20, align 8
  store i16 %21, i16* %7, align 2
  %22 = load %struct.gsm_state*, %struct.gsm_state** %4, align 8
  %23 = getelementptr inbounds %struct.gsm_state, %struct.gsm_state* %22, i32 0, i32 2
  %24 = load i64, i64* %23, align 8
  store i64 %24, i64* %8, align 8
  %25 = load %struct.gsm_state*, %struct.gsm_state** %4, align 8
  %26 = getelementptr inbounds %struct.gsm_state, %struct.gsm_state* %25, i32 0, i32 3
  %27 = load i32, i32* %26, align 8
  %28 = trunc i32 %27 to i16
  store i16 %28, i16* %9, align 2
  store i32 160, i32* %18, align 4
  br label %29

; <label>:29:                                     ; preds = %194, %3
  %30 = load i32, i32* %18, align 4
  %31 = add nsw i32 %30, -1
  store i32 %31, i32* %18, align 4
  %32 = icmp ne i32 %30, 0
  br i1 %32, label %33, label %199

; <label>:33:                                     ; preds = %29
  %34 = load i16*, i16** %5, align 8
  %35 = load i16, i16* %34, align 2
  %36 = sext i16 %35 to i32
  %37 = ashr i32 %36, 3
  %38 = shl i32 %37, 2
  %39 = trunc i32 %38 to i16
  store i16 %39, i16* %15, align 2
  %40 = load i16*, i16** %5, align 8
  %41 = getelementptr inbounds i16, i16* %40, i32 1
  store i16* %41, i16** %5, align 8
  %42 = load i16, i16* %15, align 2
  %43 = sext i16 %42 to i32
  %44 = icmp sge i32 %43, -16384
  br i1 %44, label %45, label %46

; <label>:45:                                     ; preds = %33
  br label %49

; <label>:46:                                     ; preds = %33
  %pgocount = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_Gsm_Preprocess, i64 0, i64 10)
  %47 = add i64 %pgocount, 1
  store i64 %47, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_Gsm_Preprocess, i64 0, i64 10)
  call void @__assert_fail(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i32 0, i32 0), i32 64, i8* getelementptr inbounds ([56 x i8], [56 x i8]* @__PRETTY_FUNCTION__.Gsm_Preprocess, i32 0, i32 0)) #3
  unreachable
                                                  ; No predecessors!
  br label %49

; <label>:49:                                     ; preds = %48, %45
  %50 = load i16, i16* %15, align 2
  %51 = sext i16 %50 to i32
  %52 = icmp sle i32 %51, 16380
  br i1 %52, label %53, label %54

; <label>:53:                                     ; preds = %49
  br label %57

; <label>:54:                                     ; preds = %49
  %pgocount1 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_Gsm_Preprocess, i64 0, i64 11)
  %55 = add i64 %pgocount1, 1
  store i64 %55, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_Gsm_Preprocess, i64 0, i64 11)
  call void @__assert_fail(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i32 0, i32 0), i32 65, i8* getelementptr inbounds ([56 x i8], [56 x i8]* @__PRETTY_FUNCTION__.Gsm_Preprocess, i32 0, i32 0)) #3
  unreachable
                                                  ; No predecessors!
  br label %57

; <label>:57:                                     ; preds = %56, %53
  %58 = load i16, i16* %15, align 2
  %59 = sext i16 %58 to i32
  %60 = load i16, i16* %7, align 2
  %61 = sext i16 %60 to i32
  %62 = sub nsw i32 %59, %61
  %63 = trunc i32 %62 to i16
  store i16 %63, i16* %10, align 2
  %64 = load i16, i16* %15, align 2
  store i16 %64, i16* %7, align 2
  %65 = load i16, i16* %10, align 2
  %66 = sext i16 %65 to i32
  %67 = icmp ne i32 %66, -32768
  br i1 %67, label %68, label %69

; <label>:68:                                     ; preds = %57
  br label %72

; <label>:69:                                     ; preds = %57
  %pgocount2 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_Gsm_Preprocess, i64 0, i64 12)
  %70 = add i64 %pgocount2, 1
  store i64 %70, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_Gsm_Preprocess, i64 0, i64 12)
  call void @__assert_fail(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i32 0, i32 0), i32 81, i8* getelementptr inbounds ([56 x i8], [56 x i8]* @__PRETTY_FUNCTION__.Gsm_Preprocess, i32 0, i32 0)) #3
  unreachable
                                                  ; No predecessors!
  br label %72

; <label>:72:                                     ; preds = %71, %68
  %73 = load i16, i16* %10, align 2
  %74 = sext i16 %73 to i64
  store i64 %74, i64* %11, align 8
  %75 = load i64, i64* %11, align 8
  %76 = shl i64 %75, 15
  store i64 %76, i64* %11, align 8
  %77 = load i64, i64* %8, align 8
  %78 = ashr i64 %77, 15
  %79 = trunc i64 %78 to i16
  store i16 %79, i16* %13, align 2
  %80 = load i64, i64* %8, align 8
  %81 = load i16, i16* %13, align 2
  %82 = sext i16 %81 to i64
  %83 = shl i64 %82, 15
  %84 = sub nsw i64 %80, %83
  %85 = trunc i64 %84 to i16
  store i16 %85, i16* %14, align 2
  %86 = load i16, i16* %14, align 2
  %87 = sext i16 %86 to i64
  %88 = mul nsw i64 %87, 32735
  %89 = add nsw i64 %88, 16384
  %90 = ashr i64 %89, 15
  %91 = load i64, i64* %11, align 8
  %92 = add nsw i64 %91, %90
  store i64 %92, i64* %11, align 8
  %93 = load i16, i16* %13, align 2
  %94 = sext i16 %93 to i64
  %95 = mul nsw i64 %94, 32735
  store i64 %95, i64* %12, align 8
  %96 = load i64, i64* %12, align 8
  %97 = icmp slt i64 %96, 0
  br i1 %97, label %98, label %126

; <label>:98:                                     ; preds = %72
  %99 = load i64, i64* %11, align 8
  %100 = icmp sge i64 %99, 0
  br i1 %100, label %101, label %106

; <label>:101:                                    ; preds = %98
  %pgocount3 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_Gsm_Preprocess, i64 0, i64 4)
  %102 = add i64 %pgocount3, 1
  store i64 %102, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_Gsm_Preprocess, i64 0, i64 4)
  %103 = load i64, i64* %12, align 8
  %104 = load i64, i64* %11, align 8
  %105 = add nsw i64 %103, %104
  br label %124

; <label>:106:                                    ; preds = %98
  %107 = load i64, i64* %12, align 8
  %108 = add nsw i64 %107, 1
  %109 = sub nsw i64 0, %108
  %110 = load i64, i64* %11, align 8
  %111 = add nsw i64 %110, 1
  %112 = sub nsw i64 0, %111
  %113 = add i64 %109, %112
  store i64 %113, i64* %17, align 8
  %114 = icmp uge i64 %113, 2147483647
  br i1 %114, label %115, label %117

; <label>:115:                                    ; preds = %106
  %pgocount4 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_Gsm_Preprocess, i64 0, i64 7)
  %116 = add i64 %pgocount4, 1
  store i64 %116, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_Gsm_Preprocess, i64 0, i64 7)
  br label %122

; <label>:117:                                    ; preds = %106
  %pgocount5 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_Gsm_Preprocess, i64 0, i64 8)
  %118 = add i64 %pgocount5, 1
  store i64 %118, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_Gsm_Preprocess, i64 0, i64 8)
  %119 = load i64, i64* %17, align 8
  %120 = sub nsw i64 0, %119
  %121 = sub nsw i64 %120, 2
  br label %122

; <label>:122:                                    ; preds = %117, %115
  %123 = phi i64 [ -2147483648, %115 ], [ %121, %117 ]
  br label %124

; <label>:124:                                    ; preds = %122, %101
  %125 = phi i64 [ %105, %101 ], [ %123, %122 ]
  br label %148

; <label>:126:                                    ; preds = %72
  %127 = load i64, i64* %11, align 8
  %128 = icmp sle i64 %127, 0
  br i1 %128, label %129, label %134

; <label>:129:                                    ; preds = %126
  %pgocount6 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_Gsm_Preprocess, i64 0, i64 1)
  %130 = add i64 %pgocount6, 1
  store i64 %130, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_Gsm_Preprocess, i64 0, i64 1)
  %131 = load i64, i64* %12, align 8
  %132 = load i64, i64* %11, align 8
  %133 = add nsw i64 %131, %132
  br label %146

; <label>:134:                                    ; preds = %126
  %135 = load i64, i64* %12, align 8
  %136 = load i64, i64* %11, align 8
  %137 = add i64 %135, %136
  store i64 %137, i64* %17, align 8
  %138 = icmp uge i64 %137, 2147483647
  br i1 %138, label %139, label %141

; <label>:139:                                    ; preds = %134
  %pgocount7 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_Gsm_Preprocess, i64 0, i64 5)
  %140 = add i64 %pgocount7, 1
  store i64 %140, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_Gsm_Preprocess, i64 0, i64 5)
  br label %144

; <label>:141:                                    ; preds = %134
  %pgocount8 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_Gsm_Preprocess, i64 0, i64 6)
  %142 = add i64 %pgocount8, 1
  store i64 %142, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_Gsm_Preprocess, i64 0, i64 6)
  %143 = load i64, i64* %17, align 8
  br label %144

; <label>:144:                                    ; preds = %141, %139
  %145 = phi i64 [ 2147483647, %139 ], [ %143, %141 ]
  br label %146

; <label>:146:                                    ; preds = %144, %129
  %147 = phi i64 [ %133, %129 ], [ %145, %144 ]
  br label %148

; <label>:148:                                    ; preds = %146, %124
  %149 = phi i64 [ %125, %124 ], [ %147, %146 ]
  store i64 %149, i64* %8, align 8
  %150 = load i64, i64* %8, align 8
  %151 = icmp slt i64 %150, 0
  br i1 %151, label %152, label %155

; <label>:152:                                    ; preds = %148
  %153 = load i64, i64* %8, align 8
  %154 = add nsw i64 %153, 16384
  br label %166

; <label>:155:                                    ; preds = %148
  %156 = load i64, i64* %8, align 8
  %157 = add i64 %156, 16384
  store i64 %157, i64* %17, align 8
  %158 = icmp uge i64 %157, 2147483647
  br i1 %158, label %159, label %161

; <label>:159:                                    ; preds = %155
  %pgocount9 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_Gsm_Preprocess, i64 0, i64 2)
  %160 = add i64 %pgocount9, 1
  store i64 %160, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_Gsm_Preprocess, i64 0, i64 2)
  br label %164

; <label>:161:                                    ; preds = %155
  %pgocount10 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_Gsm_Preprocess, i64 0, i64 3)
  %162 = add i64 %pgocount10, 1
  store i64 %162, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_Gsm_Preprocess, i64 0, i64 3)
  %163 = load i64, i64* %17, align 8
  br label %164

; <label>:164:                                    ; preds = %161, %159
  %165 = phi i64 [ 2147483647, %159 ], [ %163, %161 ]
  br label %166

; <label>:166:                                    ; preds = %164, %152
  %167 = phi i64 [ %154, %152 ], [ %165, %164 ]
  store i64 %167, i64* %12, align 8
  %168 = load i16, i16* %9, align 2
  %169 = sext i16 %168 to i64
  %170 = mul nsw i64 %169, -28180
  %171 = add nsw i64 %170, 16384
  %172 = ashr i64 %171, 15
  %173 = trunc i64 %172 to i16
  store i16 %173, i16* %13, align 2
  %174 = load i64, i64* %12, align 8
  %175 = ashr i64 %174, 15
  %176 = trunc i64 %175 to i16
  store i16 %176, i16* %9, align 2
  %177 = load i16, i16* %9, align 2
  %178 = sext i16 %177 to i64
  %179 = load i16, i16* %13, align 2
  %180 = sext i16 %179 to i64
  %181 = add nsw i64 %178, %180
  store i64 %181, i64* %16, align 8
  %182 = sub nsw i64 %181, -32768
  %183 = icmp ugt i64 %182, 65535
  br i1 %183, label %184, label %191

; <label>:184:                                    ; preds = %166
  %185 = load i64, i64* %16, align 8
  %186 = icmp sgt i64 %185, 0
  %187 = zext i1 %186 to i64
  %pgocount11 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_Gsm_Preprocess, i64 0, i64 13)
  %188 = add i64 %pgocount11, %187
  store i64 %188, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_Gsm_Preprocess, i64 0, i64 13)
  %189 = select i1 %186, i32 32767, i32 -32768
  %190 = sext i32 %189 to i64
  br label %194

; <label>:191:                                    ; preds = %166
  %pgocount12 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_Gsm_Preprocess, i64 0, i64 0)
  %192 = add i64 %pgocount12, 1
  store i64 %192, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_Gsm_Preprocess, i64 0, i64 0)
  %193 = load i64, i64* %16, align 8
  br label %194

; <label>:194:                                    ; preds = %191, %184
  %195 = phi i64 [ %190, %184 ], [ %193, %191 ]
  %196 = trunc i64 %195 to i16
  %197 = load i16*, i16** %6, align 8
  %198 = getelementptr inbounds i16, i16* %197, i32 1
  store i16* %198, i16** %6, align 8
  store i16 %196, i16* %197, align 2
  br label %29

; <label>:199:                                    ; preds = %29
  %pgocount13 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_Gsm_Preprocess, i64 0, i64 9)
  %200 = add i64 %pgocount13, 1
  store i64 %200, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_Gsm_Preprocess, i64 0, i64 9)
  %201 = load i16, i16* %7, align 2
  %202 = load %struct.gsm_state*, %struct.gsm_state** %4, align 8
  %203 = getelementptr inbounds %struct.gsm_state, %struct.gsm_state* %202, i32 0, i32 1
  store i16 %201, i16* %203, align 8
  %204 = load i64, i64* %8, align 8
  %205 = load %struct.gsm_state*, %struct.gsm_state** %4, align 8
  %206 = getelementptr inbounds %struct.gsm_state, %struct.gsm_state* %205, i32 0, i32 2
  store i64 %204, i64* %206, align 8
  %207 = load i16, i16* %9, align 2
  %208 = sext i16 %207 to i32
  %209 = load %struct.gsm_state*, %struct.gsm_state** %4, align 8
  %210 = getelementptr inbounds %struct.gsm_state, %struct.gsm_state* %209, i32 0, i32 3
  store i32 %208, i32* %210, align 8
  ret void
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
